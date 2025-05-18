package com.yash.VidyaSync;


import com.yash.VidyaSync.model.Resource;
import com.yash.VidyaSync.model.ResourceType;
import com.yash.VidyaSync.model.Subject;
import com.yash.VidyaSync.service.ResourceService;
import com.yash.VidyaSync.service.SubjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequiredArgsConstructor
public class ResourceController {

    private final SubjectService subjectService;
    private final ResourceService resourceService;

    @GetMapping("/student/resources")
    public String showResources(@RequestParam("branchId") Long branchId,
                                @RequestParam("semester") Integer semester,
                                Model model) {
        // Fetching subjects for the selected branch & semester
        List<Subject> subjects = subjectService.getSubjectsByBranchAndSemester(branchId.intValue(), semester);
        model.addAttribute("subjects", subjects);

        return "resources"; // JSP page to display subjects & resources
    }

    @GetMapping("/student/resource-details")
    public String showResourceDetails(@RequestParam("subjectId") Long subjectId,
                                      Model model) {
//        System.out.println(subjectId);
//        List<Resource> resources = resourceService.getResourcesBySubject(subjectId);
//        for(Resource res : resources){
//            System.out.println(res.getFileName());
//        }
//        model.addAttribute("resources", resources);
//        return "resource-details"; // This JSP will display available resources


        List<ResourceType> resources = resourceService.findResourceTypesBySubjectId(subjectId);
//        for(ResourceType res : resources){
//            System.out.println(res.getResourceName());
//        }
        model.addAttribute("resources", resources);
        model.addAttribute("subjectId", subjectId);
        return "resource-details";
    }

    @GetMapping("/student/resource-type")
    public String showResourceType(@RequestParam("resourceTypeId") Long resourceTypeId,
                                      @RequestParam("subjectId") Long subjectId,
                                      Model model) {
        List<Resource> resources = resourceService.getResourcesBySubjectAndType(subjectId, resourceTypeId);
        for(Resource res : resources){
            System.out.println(res.getFileName());
        }
        model.addAttribute("resources", resources);
        return "resource-types";
    }

//    @GetMapping("student/download/{fileLink}")
//    public String downloadResourceType(@RequestParam("fileLink") String fileLink,
//                                   Model model) {
////        https://drive.google.com/file/d/1kEDf1kSwVGDWI3OanL7I_0_WkxdxkFdJ/view?usp=sharing
////        https://drive.google.com/file/d/1qwTTyelcVzh4QFTGUrt8h4p5Viv7b3Ip/preview : 31
//        String id = fileLink.substring(32, fileLink.length() - 8);
//        String url = "https://drive.google.com/uc?export=download&id"+"="+id;
//
//        return "redirect:"+url;
//    }

    @GetMapping("/student/download")
    public String downloadResourceType(@RequestParam("fileLink") String fileLink, Model model) {
        Pattern pattern = Pattern.compile("/d/([a-zA-Z0-9_-]{25,})");
        Matcher matcher = pattern.matcher(fileLink);
        String id;
        if (matcher.find()) {
            id = matcher.group(1);
        } else {
            return "resource-types";
        }

        String url = "https://drive.google.com/uc?export=download&id=" + id;
        return "redirect:" + url;
    }

}

