FROM alpine
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        curl \
        && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator

VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
