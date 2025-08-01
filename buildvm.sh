
docker rm -f PDF-Seal && \
docker rmi pdf-png-pdf-converter && \
docker build -t pdf-png-pdf-converter . && \
docker run -d --name PDF-Seal -v "C:/Users/User/source/repos/pdf-png-pdf/shared":/home/app pdf-png-pdf-converter
