## Construir la imagen de docker

docker build -t terraform-docker .

docker run --rm -v $(pwd):/terraform terraform-docker init

docker run --rm -v $(pwd):/terraform terraform-docker plan 

echo yes | docker run --rm -i -v $(pwd):/terraform terraform-docker apply 
