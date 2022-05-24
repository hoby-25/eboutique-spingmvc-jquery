package org.sid.eboutique;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("ajax")
public class AjaxController {
	
	@RequestMapping(method= RequestMethod.GET)
	public String index() {
		return "ajax/index";
	}
}
