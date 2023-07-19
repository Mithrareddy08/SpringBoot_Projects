package com.example.demo.Controller;

import com.example.demo.SubmissionDTO;
import com.example.demo.service.SubmissionServiceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/submission")
public class SubmissionController  {
    @Autowired
    private SubmissionServiceImp submissionService;


    @PostMapping("/postSubmission")
    public SubmissionDTO postSubmission(@RequestBody SubmissionDTO sf) {
        return submissionService.postSubmission(sf);
    }


    @GetMapping("/getSubmission/{Id}")
    public SubmissionDTO getSubmissionFormById(@PathVariable String Id) {
        SubmissionDTO record=new SubmissionDTO();
        record=submissionService.getSubmissionFormById(Id);
        return record;
    }

    @GetMapping("/getallSubmissions")
    public List<SubmissionDTO> getallSubmissions() {
        return submissionService.getallSubmissions();
    }

    @PutMapping("/edit")
    public SubmissionDTO editSubmission(@RequestBody SubmissionDTO sf) {
        return submissionService.editSubmission(sf);
    }

    @DeleteMapping("/delete/{Id}")
    public List<SubmissionDTO> deleteSubmission(@PathVariable String Id) {
        return submissionService.deleteSubmission(Id);
    }
}