#!/bin/bash
###############################################
# scrubMClog.sh
###############################################

###############################################
# VARIABLES
###############################################
set +x
MCLOGPATH=/home/lalligood/McMyAdmin/Minecraft/logs
PREVDATE=`date -d "-1 days" +%Y-%m-%d`
LOGCOUNT=`ls -l $MCLOGPATH/${PREVDATE}*.log.gz | wc -l`
MCNAME=lalligood
MAIL_TO=lalligood@gmail.com
MAIL_FROM=lancer@lancer.serveminecraft.net
SUBJECT="Minecraft logs for ${PREVDATE}"
MAIL_LOG=/tmp/${PREVDATE}-mc.log

###############################################
# SCRUB LOGS
###############################################
cd ${MCLOGPATH}
x=1 # Start with first log file
while (( x <= ${LOGCOUNT} )); do
	CURRLOG_GZ=${PREVDATE}-$x.log.gz
	CURRLOG=${PREVDATE}-$x.log
	zgrep ${MCNAME} ${CURRLOG_GZ}
	if [[ $? -eq 0 ]]; then
		echo "##########" >> ${MAIL_LOG}
		echo ${CURRLOG_GZ} >> ${MAIL_LOG}
		echo "##########" >> ${MAIL_LOG}
		gunzip ${CURRLOG_GZ}
		cat ${CURRLOG} >> ${MAIL_LOG}
		gzip ${CURRLOG}
		echo . >> ${MAIL_LOG}
	fi
	((x++)) # Increment for next log file
done

###############################################
# EMAIL RESULTS & CLEANUP
###############################################
if [ -s ${MAIL_LOG} ]; then
	cat ${MAIL_LOG} | mailx -s "${SUBJECT}" -r ${MAIL_FROM} ${MAIL_TO}
	rm ${MAIL_LOG}
fi
