{{- define "app.labels" }}
app: {{ .Chart.Name }}
id: {{ .Values.id | quote }}
version: {{ .Chart.Version }}
{{- end }}


{{- define "app.name" -}}
{{- printf "%s-%s" .Chart.Name .Values.id }}
{{- end -}}

{{- define "app.selector" }}
app: {{ .Chart.Name  }}
id: {{ .Values.id  }}
{{- end }}