ARGS="${refgen} ${indpre} ${refann} ${input1} ${input2} ${input3} ${input3} ${input4} ${input5} ${input6} ${input7} ${input8} ${maskfile_links} ${maskfile_diff} ${insertsize} ${stdev} ${discalign} ${mixalign} ${libtype} ${sensitivity} ${fastqscale} ${minanchor} ${minintron_tophat} ${maxintron_tophat} ${maxalign} ${minreadlength} ${usegtf} ${userescue} ${lab1} ${lab2} ${lab3} ${lab4} ${maxit} ${idpre} ${isofrac} ${intraintrtresh} ${maxintron_cufflinks} ${minintron_cufflinks} ${junctionalpha} ${anchfrac} ${mintransfrag} ${termexonmax} ${trimcovavg} ${trimfrac} ${transfraggap} ${transfraggap} ${userescuecd} ${testalign} ${testfdr} ${normalhits} -proc 12"

function in_for {
	res=(${1})
	res=${res[@]:1}
	res=`for el in ${res}; do echo $el", ";done`
}

elenco=("${refgen}" "${refann}" "${input1}" "${input2}" "${input3}" "${input4}" "${input5}" "${input6}" "${input7}" "${input8}" "${maskfile_links}" "${maskfile_diff}")
for el in "${elenco[@]}"
  do
    in_for "${el}"
    total+=${res}
  done

INPUTS=${total}

echo  universe                = docker >> lib/condorSubmitEdit.htc
echo docker_image            =  cyverseuk/tuxedo >> lib/condorSubmitEdit.htc ######
echo arguments				= ${ARGS} >> lib/condorSubmitEdit.htc
echo transfer_input_files = ${INPUTS} >> lib/condorSubmitEdit.htc
cat lib/condorSubmit.htc >> lib/condorSubmitEdit.htc

less lib/condorSubmitEdit.htc

jobid=`condor_submit lib/condorSubmitEdit.htc`
jobid=`echo $jobid | sed -e 's/Sub.*uster //'`
jobid=`echo $jobid | sed -e 's/\.//'`

#echo $jobid

#echo going to monitor job $jobid
condor_tail -f $jobid

exit 0

