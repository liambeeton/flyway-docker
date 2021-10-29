FROM mcr.microsoft.com/azure-sql-edge
ENV ACCEPT_EULA 1
ENV MSSQL_SA_PASSWORD Passw0rd
# copy from host to container
COPY ./entrypoint.sh ./SqlCmdStartup.sh ./SqlCmdScript.sql ./ 
# RUN chmod +x ./SqlCmdStartup.sh
CMD /bin/bash ./entrypoint.sh