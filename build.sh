#!/bin/bash
source functions.sh

logInfoMessage "I'll scan the code for dependencies available at [$WORKSPACE] and have mounted at [$CODEBASE_DIR]"
sleep  $SLEEP_DURATION
cd  $WORKSPACE/${CODEBASE_DIR}

COMPONENT_NAME=`getComponentName`
/usr/share/dependency-check/bin/dependency-check.sh --scan $WORKSPACE/${CODEBASE_DIR} --project "${COMPONENT_NAME}" --format "${OWASP_REPORT_FORMAT}" --out ${OWASP_REPORT}