FROM python:3.8-bullseye

WORKDIR /src
COPY . .
RUN pip install --no-cache-dir \
    booleanOperations==0.8.0 \
    compreffor==0.4.5 \
    cu2qu==1.3.0 \
    defcon==0.3.5 \
    fontmake==1.4.0 \
    fontMath==0.4.4 \
    fonttools==3.21.2 \
    glyphsLib==2.2.1 \
    MutatorMath==2.1.0 \
    pyclipper==1.0.5 \
    ufo2ft==1.1.0 \
    ufoLib==2.1.1 \
    && tools/scripts/install/ttfautohint-build.sh \
    && ./build-woff.sh --install-dependencies \
    && ./build-woff2.sh --install-dependencies
ENTRYPOINT ["make"]
