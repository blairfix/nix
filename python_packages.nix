{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  [ 

	( python3.withPackages( ps: with ps; [ 

		pandas 
		datetime
		tqdm
		grip
		imutils
		linode-cli
		python310Packages.selenium
		python310Packages.radian

	    ]))
    ];
}
