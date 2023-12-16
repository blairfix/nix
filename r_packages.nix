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

	    ];
	};
    in [
	R-with-my-packages
    ];
}
