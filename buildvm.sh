
# docker rm -f PDF-Seal && \
# docker rmi pdf-png-pdf-converter && \
docker build -t pdf-png-pdf-converter . && \
docker run -d --name PDF-Seal -v ./shared:/home/app pdf-png-pdf-converter
