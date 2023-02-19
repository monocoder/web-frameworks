FROM node:16.17-alpine

WORKDIR /usr/src/app

{{#files}}
  COPY '{{source}}' '{{target}}'
{{/files}}

ENV NODE_ENV production

{{#deps}}
  RUN apk add {{{.}}}
{{/deps}}

{{#bootstrap}}
  RUN {{{.}}}
{{/bootstrap}}

{{#environment}}
  ENV {{{.}}}
{{/environment}}

{{#fixes}}
  RUN {{{.}}}
{{/fixes}}

CMD {{{command}}}