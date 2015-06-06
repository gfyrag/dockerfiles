FROM ubuntu:14.04
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ENV VERSION 1.6.1

# sed on CMakeLists.txt because of : 
# pthread not linked when compiling : 
# * Solution that works : https://github.com/synergy/synergy/issues/3854
# * Recurrent solution (not tested) : http://stackoverflow.com/questions/20132389/synergy-wont-compile-undefined-reference-to-pthread-xxxx
RUN apt-get update \
	&& apt-get install wget gcc cmake libx11-dev libxtst-dev unzip git g++ -y \
	&& git clone https://github.com/synergy/synergy \
	&& cd synergy \
	&& git checkout $VERSION \
	&& unzip ./tools/cryptopp562.zip -d ./tools/cryptopp562 \
	&& sed -i 's,list(APPEND libs pthread),set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread"),g' CMakeLists.txt \
	&& cmake . \
	&& make \
	&& apt-get remove wget gcc cmake unzip git g++ -y --purge \
	&& apt-get autoremove -y \
	&& apt-get clean

ENV DISPLAY :0
ENV PATH $PATH:/synergy/bin
