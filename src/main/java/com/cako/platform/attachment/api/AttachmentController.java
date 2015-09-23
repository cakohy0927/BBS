package com.cako.platform.attachment.api;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cako.platform.attachment.entity.Attachment;
import com.cako.platform.attachment.service.AttachmentService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.FileTools;
import com.orm.commons.utils.JsonMapper;
import com.orm.commons.utils.MessageObject;
import com.orm.commons.utils.ObjectTools;

@Controller
@RequestMapping(value = "/platform")
public class AttachmentController {

    @Autowired
    private AttachmentService attachmentService;

    private MessageObject message = new MessageObject();

    @RequestMapping(value = "/attachment/create")
    public String create(HttpServletRequest request, Model model) {

        return "platform/attachment/attachmentCreate";
    }

    @RequestMapping(value = "/attachment/copy", method = RequestMethod.POST)
    @ResponseBody
    public String copy(@RequestParam MultipartFile[] myfiles, MultipartHttpServletRequest request, HttpServletResponse response) {
        String activiti = request.getParameter("activiti");
        String realPath = "";
        if (StringUtils.isNotEmpty(activiti)) {
            realPath = request.getSession().getServletContext().getRealPath("/upload") + File.separatorChar + activiti;
        } else {
            realPath = request.getSession().getServletContext().getRealPath("/upload/temp");
        }
        if (!new File(realPath).exists()) {
            new File(realPath).mkdirs();
        }

        Iterator<String> iterator = request.getFileNames();
        List<Attachment> versions = new ArrayList<Attachment>();
        while (iterator.hasNext()) {
            MultipartFile multipartFile = request.getFile((String) iterator.next());
            String type = multipartFile.getContentType();
            String name = multipartFile.getOriginalFilename();
            float size = (float) (multipartFile.getSize() / (1024));
            String fileSize = "";
            if (size > 1024 && size < 1024 * 1024) {
                fileSize = (size / 1024) + "MB";
            } else if (size >= 1024 * 1024) {
                fileSize = (size / 1024 / 1024) + "GB";
            } else {
                fileSize = size + "KB";
            }
            String path = realPath + File.separatorChar + name;
            Attachment version = new Attachment(name, new File(path).getPath(), type, fileSize, FileTools.getFileExtension(name));
            try {
                FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), new File(realPath, multipartFile.getOriginalFilename()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            versions.add(version);
        }
        return new JsonMapper().toJson(versions);
    }


    @RequestMapping(value = "/attachment/fileUpload", method = RequestMethod.POST)
    public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
        String realPath = request.getSession().getServletContext().getRealPath("/upload");
        if (!new File(realPath).exists()) {
            new File(realPath).mkdirs();
        }
        String versionIds = "";
        String[] values = request.getParameterValues("myfiles");
        try {
            if (values != null && values.length > 0) {
                for (String filePath : values) {
                    File file = new File(filePath);
                    FileInputStream fin = new FileInputStream(file);
                    String contentType = new MimetypesFileTypeMap().getContentType(file);
                    long files = FileTools.getFileSizes(file);
                    String fileSize = FileTools.formetFileSize(files);//文件的大小
                    String suffix = FileTools.getFileExtension(file.getName());//文件的后缀
                    String name = file.getName();
                    name = name.substring(0, name.lastIndexOf("."));
                    Attachment attachment = new Attachment(name, "/upload/" + file.getName(), contentType, fileSize, suffix);
                    attachment = attachmentService.save(attachment);
                    FileUtils.copyInputStreamToFile(fin, new File(realPath, file.getName()));
                    versionIds += attachment.getId() + ",";
                }
                if (StringUtils.isNotEmpty(versionIds)) {
                    versionIds = versionIds.substring(0, versionIds.length() - 1);
                }
                message.setObject(versionIds);
                message.setInforMessage("上传成功");
            } else {
                message.setErrorMessage("请先选择文件，再上传");
            }
        } catch (Exception e){
            e.printStackTrace();
            message.setErrorMessage("上传文件失败");
        } finally {
            try {
                response.getWriter().write(message.getJsonMapper(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/attachment/attachmentList", method = {RequestMethod.POST, RequestMethod.GET})
    public String attachmentList(HttpServletRequest request, HttpServletResponse response, Model model) {
        String currentPage = request.getParameter("currentPage");
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            ObjectTools<Attachment> tools = attachmentService.queryPageByMap(map, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
            model.addAttribute("tools", tools);
            model.addAttribute("currentPage", currentPage);
            model.addAttribute("attachmentList", tools.getEntities());
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return "platform/attachment/attachmentList";
    }
}
