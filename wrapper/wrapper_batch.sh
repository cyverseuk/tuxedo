#!/bin/bash

rmthis=`ls`
echo ${rmthis}

ARGS="${refgen} ${indpre} ${refann} ${input1} ${input2} ${input3} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8} ${maskfile_links} ${maskfile_diff} ${insertsize} ${stdev} ${discalign} ${mixalign} ${libtype} ${sensitivity} ${fastqscale} ${minanchor} ${minintron_tophat} ${maxintron_tophat} ${maxalign} ${minreadlength} ${usegtf} ${userescue} ${lab1} ${lab2} ${lab3} ${lab4} ${maxit} ${idpre} ${isofrac} ${intraintrtresh} ${maxintron_cufflinks} ${minintron_cufflinks} ${junctionalpha} ${anchfrac} ${mintransfrag} ${termexonmax} ${trimcovavg} ${trimfrac} ${transfraggap} ${transfraggap} ${userescuecd} ${testalign} ${testfdr} ${normalhits} -proc 12"
INPUTS="${refgen} ${refann} ${input1} ${input2} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8} ${maskfile_links} ${maskfile_diff}"

echo ${ARGS};

docker run cyverseuk/tuxedo ${ARGS};

rmthis=`echo ${rmthis} | sed s/.*\.out// -`
rmthis=`echo ${rmthis} | sed s/.*\.err// -`
rm --verbose ${rmthis}
