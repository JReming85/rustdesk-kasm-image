FROM kasmweb/core-ubuntu-bionic:1.10.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

RUN  TEMP_DEB="$(mktemp)" \
	&& apt-get -f install libxcb-randr0 libxdo3\ TEMP_DEB="$(mktemp)" \
	&& LATESTURL="$(curl -f -L https://github.com/rustdesk/rustdesk/releases/latest | grep -Eo '"https://[a-zA-Z0-9#~.*,/!?=+&_%:-]*-x86_64.deb"')" \
	&& LATESTURL=${LATESTURL/\"/} \
	&& wget -P /tmp -O ${TEMP_DEB/\/tmp\//} ${LATESTURL/\"/} \
	&& echo $TEMP_DEB
	&& dpkg -i "$TEMP_DEB" \
	&& rm -f "$TEMP_DEB" \
	&& wget -O "$HOME/Desktop/rustdesk.desktop" https://gitlab.com/jeremyrem/rustdesk-kasm-image/-/raw/main/rustdesk.desktop \
	&& curl https://bin.jremi.com/selif/rustdesk.desktop -o "$HOME/Desktop/rustdesk.desktop" \
	&& chmod +x $HOME/Desktop/rustdesk.desktop  \
	&& chown 1000:1000 $HOME/Desktop/rustdesk.desktop

RUN echo "/usr/bin/desktop_ready && /usr/lib/rustdesk/rustdesk &" > $STARTUPDIR/custom_startup.sh \
&& chmod +x $STARTUPDIR/custom_startup.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
