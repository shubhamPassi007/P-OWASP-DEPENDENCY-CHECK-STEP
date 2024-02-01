FROM owasp/dependency-check

USER root
RUN apk add --no-cache --upgrade bash
RUN apk add jq

USER ${UID}
WORKDIR /usr/share/dependency-check  
COPY BP-BASE-SHELL-STEPS/functions.sh .

ENV OWASP_REPORT_FORMAT "CSV"
ENV OWASP_REPORT "report"

ENV ACTIVITY_SUB_TASK_CODE OWASP-DC-TASK
ENV SLEEP_DURATION 5s
ENV VALIDATION_FAILURE_ACTION WARNING

COPY BP-BASE-SHELL-STEPS/functions.sh .
COPY build.sh .
ENTRYPOINT [ "./build.sh" ]
