package com.cako.platform.attachment.service.impl;

import com.cako.platform.attachment.dao.AttachmentDao;
import com.cako.platform.attachment.entity.Attachment;
import com.cako.platform.attachment.service.AttachmentService;
import com.orm.commons.service.impl.DefaulfAbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Transactional(readOnly = false)
public class VersionServiceImpl extends DefaulfAbstractService<Attachment,String> implements AttachmentService {

	@Autowired
	private AttachmentDao attachmentDao;
	

	@Override
	public List<Attachment> getVersions(List<String> versionIds) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id_in", versionIds);
		return attachmentDao.queryByMap(paramMap );
	}

}
