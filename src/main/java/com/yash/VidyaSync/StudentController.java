package com.yash.VidyaSync;

import com.yash.VidyaSync.model.Branch;
import com.yash.VidyaSync.service.BranchService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
//@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentController {

    private final BranchService branchService;

    @GetMapping("/")
    public String home(){
        return "home";
    }

    @GetMapping("/select")
    public String showSelectionPage(Model model) {
        List<Branch> branches = branchService.getAllBranches();
        for(Branch branch : branches){
            System.out.println(branch.getBranchName());
        }
        model.addAttribute("branches", branches);
        return "select"; // This refers to select.jsp
    }

    @PostMapping("/process-selection")
    public String processSelection(@RequestParam("branchId") Long branchId,
                                   @RequestParam("semester") Integer semester,
                                   RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("branchId", branchId);
        redirectAttributes.addAttribute("semester", semester);
        return "redirect:/student/resources";
    }
}

