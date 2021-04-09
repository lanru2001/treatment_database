{{/*
Expand the name of the chart.
*/}}
{{- define "treatment-database.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "treatment-database.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "treatment-database.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "treatment-database.labels" -}}
{{/* REC: This should be the chart name and version: {{ .Chart.Name }}-{{ .Chart.Version \| replace "+" "_" }}.*/}}
helm.sh/chart: {{ include "treatment-database.chart" . }}
{{/* OPT: When multiple charts or pieces of software are used together to make one application. For example, application software and a database to produce a website. This can be set to the top level application being supported*/}}
app.kubernetes.io/part-of: {{ .Release.Name }}
{{ include "treatment-database.selectorLabels" . }}
{{- if .Chart.AppVersion }}
{{/* OPT: The version of the app and can be set to {{ .Chart.AppVersion }}.*/}}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{/* REC: This should always be set to {{ .Release.Service }}. It is for finding all things managed by Helm. */}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "treatment-database.selectorLabels" -}}
app.kubernetes.io/name: {{ include "treatment-database.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "treatment-database.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "treatment-database.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
