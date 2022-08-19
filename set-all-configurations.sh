#/bin/bash
configDirectory=$PWD
if [ -z "$1" ]
  then
	echo "No config directory supplied. Assuming '" $configDirectory "' as config directory."
  else
    configDirectory=$1
fi

# Update all instances of local dir with docker image directories for all config/contrib entries
sed -i -e 's|/home/riro/TKW-5.0.5/TKW/|/home/service/TKW/|g' ${configDirectory}/tkw-x_cleartext.properties

# Update all output directories with docker image volume directories
sed -i -e "/^tks.evidencemetadata.location/c\tks.evidencemetadata.location /home/service/data/all_evidence" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.validator.reports/c\tks.validator.reports /home/service/data/all_evidence" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.logdir/c\tks.logdir /home/service/data/logs" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.savedmessages/c\tks.savedmessages /home/service/data/all_evidence" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.sender.destination/c\tks.sender.destination /home/service/data/transmitter_sent_messages" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.validator.source/c\tks.validator.source /home/service/data/messages_for_validation" ${configDirectory}/tkw-x_cleartext.properties

# Update FHIR profile directory with docker image volume directories (This should be done in a more programatic fasion with a loop - run out of time :-)) 
sed -i -e "/^tks.validator.hapifhirvalidator.evaluate.assetdir/c\tks.validator.hapifhirvalidator.evaluate.assetdir /home/service/fhir/evaluate" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.validator.hapifhirvalidator.evaluate.profileversionfilelocation/c\tks.validator.hapifhirvalidator.evaluate.profileversionfilelocation /home/service/fhir/evaluate/profile_version.txt" ${configDirectory}/tkw-x_cleartext.properties

# Update FHIR profile directory with docker image volume directories (This should be done in a more programatic fasion with a loop - run out of time :-)) 
sed -i -e "/^tks.validator.hapifhirvalidator.UEC.assetdir/c\tks.validator.hapifhirvalidator.UEC.assetdir /home/service/fhir/UEC" ${configDirectory}/tkw-x_cleartext.properties
sed -i -e "/^tks.validator.hapifhirvalidator.UEC.profileversionfilelocation/c\tks.validator.hapifhirvalidator.UEC.profileversionfilelocation /home/service/fhir/UEC/profile_version.txt" ${configDirectory}/tkw-x_cleartext.properties

# Update Simulator ruleset with docker image directories
sed -i -e 's|/home/riro/TKW-5.0.5/TKW/|/home/service/TKW/|g' ${configDirectory}/simulator_config/test_tks_rule_config.txt
# Update Validator ruleset with docker image directories
sed -i -e 's|/home/riro/TKW-5.0.5/TKW/|/home/service/TKW/|g' ${configDirectory}/validator_config/validator.conf

