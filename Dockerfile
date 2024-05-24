FROM irepo.intersystems.com/intersystems/irishealth:2022.1.4.812.0-53
#FROM irepo.intersystems.com/intersystems/irishealth-arm64:2022.1.4.812.0-53

USER ${ISC_PACKAGE_MGRUSER}
COPY iris.script /tmp/iris.script
COPY IRISSetup.cls /tmp/IRISSetup.cls
COPY iris.key ${ISC_PACKAGE_INSTALLDIR}/mgr/iris.key

RUN iris start IRIS \
    && iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
