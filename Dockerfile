FROM python:3.5.6-stretch

# RUN echo `python --version`
# https://github.com/lferry007/LargeVis

WORKDIR /root

RUN cd /root \
        && wget -c -t 0 http://mirrors.ustc.edu.cn/gnu/gsl/gsl-2.5.tar.gz \
        && tar -zxvf gsl-2.5.tar.gz \
        && cd gsl-2.5/ \
        && ./configure \
        && make \
        && make install

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
ENV LANG C.UTF-8
ENV TERM xterm

RUN cd /root  \
        && git clone https://github.com/lferry007/LargeVis.git \
        && cd /root/LargeVis/Linux \
        && g++ LargeVis.cpp main.cpp -o LargeVis -lm -pthread -lgsl -lgslcblas -Ofast -march=native -ffast-math

#root@c26bdb5e5b7d:~/LargeVis/Linux# ./LargeVis -input mnist_vec784D.txt -output mnist_vec2D.txt -threads 16
#gswyhq@gswyhq-PC:~/LargeVis$ python3 plot.py -input mnist_vec2D.txt -label mnist_label.txt -output mnist_vec2D_plot
# gswyhq@gswyhq-PC:~/LargeVis$ docker run --rm -it -v $PWD:/mnt gswyhq/largevis /root/LargeVis/Linux/LargeVis -input /mnt/mnist_vec784D.txt -output /mnt/mnist_vec2D.txt -threads 16


#EXPOSE 8000

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]

# docker build -t gswyhq/largevis -f Dockerfile .

