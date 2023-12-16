{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  [ 

	( python3.withPackages( ps: with ps; [ 

		# compute
		pandas 
		datetime
		tqdm
		grip
		imutils

		# scraping
		python310Packages.selenium

		# r console
		python310Packages.radian

		# linode
		python310Packages.boto

		# ssl
		python310Packages.requests 
		python310Packages.cryptography

	    ]))
    ];
}
