package com.cako.basic.tribune.reply.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cako.basic.tribune.reply.entity.ReplyNote;
import com.cako.basic.tribune.reply.service.ReplyNoteService;
import com.orm.commons.service.impl.DefaulfAbstractService;

@Service
@Transactional(readOnly = true)
public class ReplyNoteServiceImpl extends DefaulfAbstractService<ReplyNote, String> implements ReplyNoteService {

}
