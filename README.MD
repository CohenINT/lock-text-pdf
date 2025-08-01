# pdf-png-pdf

A utility for converting PDF files to PNG images and back, using shell scripts and Docker.

## Features

- Convert PDF files to PNG images
- Convert PNG images back to PDF
- Dockerized for easy setup

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your system

### Build the Docker Image and install docker container

```bash
chmod +x ./buildvm.sh
```

### Usage

#### Convert PDF to PNG and back to PDF to lock the text.

1) put the wanted PDF files in "shared" folder.
2) in the docker container terminal write: ./convert.sh to execute the shell script and lock the texts inside pdfs.
 
> Replace `input.pdf`/`input.png` and `output.png`/`output.pdf` with your actual filenames.

## File Structure

- `convert.sh` - Script to handle conversion
- `dockerfile` - Docker build instructions
- `policy.xml` - ImageMagick policy file
- `shared/` -  shared volume storage folder. we transfer files from hosting machine to docker machine using this folder.

## Notes

- Make sure your files are in the current directory when running the Docker command.
- Make sure the path /etc/ImageMagick-6 exist in the docker container, otherwise edit convert.sh script accoridngly to the right path.
- Adjust volume mounting (`-v`) as needed for your environment.

## License

MIT.
