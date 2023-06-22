return {
	{ "junegunn/fzf", build = "./install --bin", },
	{ "ibhagwan/fzf-lua",
           keys={
		   {"<c-p>",function() require('fzf-lua').files() end,}
	   },
   }
}
