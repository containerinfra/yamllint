FROM python:3.9-slim AS build-env

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN sed -i 's/#!\/usr\/local\/bin\/python/#!\/usr\/bin\/python/g' /usr/local/bin/yamllint

FROM gcr.io/distroless/python3-debian11:debug
COPY --from=build-env /usr/local/bin/yamllint /usr/local/bin/yamllint

COPY --from=build-env /usr/local/lib/python3.9/site-packages/yamllint /usr/local/lib/python3.9/site-packages/yamllint
COPY --from=build-env \
    /usr/local/lib/python3.9/site-packages/yaml /usr/local/lib/python3.9/site-packages/yaml
COPY --from=build-env \
    /usr/local/lib/python3.9/site-packages/pathspec /usr/local/lib/python3.9/site-packages/pathspec

ENV PYTHONPATH=/usr/local/lib/python3.9/site-packages
ENTRYPOINT [ "/bin/sh" ]
CMD [ "/usr/local/bin/yamllint"]
