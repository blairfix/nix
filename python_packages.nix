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
		selenium

		# r console
		radian

		# linode
		boto

		# ssl
		requests 
		cryptography

	    ]))
    ];
}
