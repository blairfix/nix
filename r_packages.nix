{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  

    let
	R-with-my-packages = rWrapper.override{ 
	    packages = with rPackages; [ 

		ggplot2 
		#dplyr 
		#data_table
		#Rcpp
		#RcppArmadillo
		#BH
		#mailR
		#sf
	    ];
	};
    in [
	R-with-my-packages
    ];
}
