{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  

    let
	R-with-my-packages = rWrapper.override{ 
	    packages = with rPackages; [ 

		tidyverse
		BH
		data_table
		doSNOW
		cowplot
		foreach
		ggrepel
		gridExtra
		gtable
		haven
		here
		lexicon
		magrittr
		stringi
		mailR
		microbenchmark
		ngramr
		oce
		osfr
		png
		pracma
		progress
		readxlsb
		rlecuyer
		R_utils
		Rcpp
		RcppArmadillo
		RcppGSL
		RcppZiggurat
		scales
		snow
		VGAM
		xtable
		wordcloud2
		ggpubr
		qdapRegex
		fastmatch
		webshot
		RcppRoll
		tm
		ggcorrplot
		xlsx
		sf
		igraph
		tidygraph
		tidyquant
		ggraph
		ggiraph
		roll
		poweRlaw
		magick
		truncnorm
		fuzzyjoin
		ggtext

		
		# blair's packages
		(buildRPackage {
		 name = "bfstr";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstr";
		 rev = "master";
		 sha256 = "sha256-3MT+tTQpcpoNbknadRf1QBPI0EXm3q+nMuL8GJ20bFM";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfstat";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstat";
		 rev = "master";
		 sha256 = "sha256-fuCCJZHZoXkVycMnHZ37HGd2wwetLbAVWryjBNeWSUc";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfgg";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfgg";
		 rev = "master";
		 sha256 = "sha256-y2E8QYjiuHHVxgS+LXv5nYL8RBFDekD5nYgRdNZly7g";
		 };
		 propagatedBuildInputs = [ ggplot2 gridExtra data_table here ];
		 })
#
#		(buildRPackage {
#		 name = "hmod";
#		 src = fetchFromGitHub {
#		 owner = "blairfix";
#		 repo = "hmod";
#		 rev = "master";
#		 sha256 = "";
#		 };
#		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH RcppZiggurat ];
#		 })
#


	    ];
	};
    in [
	R-with-my-packages
    ];
}
