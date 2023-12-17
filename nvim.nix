{ pkgs, ... }:
{

    # neo vim
    programs.neovim = {
	enable = true;
	configure = {
	    packages.myVimPackage = with pkgs.vimPlugins; {
		start = [ goyo-vim  ];
	    };
	};
    extraConfig = ''source ~/.config/nvim/init.vim'';
    };
}
