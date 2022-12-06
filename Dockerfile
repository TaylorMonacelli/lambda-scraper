FROM amazon/aws-lambda-python:latest

RUN yum -y install unzip awscli git

RUN version=1.3.6 && \
    mkdir -p /usr/local/src/ &&  \
    curl -sSL -o /usr/local/src/terraform_${version}_linux_amd64.zip https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip && \
    unzip -o -d /usr/local/src/terraform_${version}_linux_amd64 /usr/local/src/terraform_${version}_linux_amd64.zip &&  \
    ln -fs /usr/local/src/terraform_${version}_linux_amd64/terraform /usr/local/bin/terraform &&  \
    /usr/local/bin/terraform -version

RUN pip install requests-html boto3
