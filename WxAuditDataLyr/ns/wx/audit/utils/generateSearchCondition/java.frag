<?xml version="1.0" encoding="UTF-8"?>

<Values version="2.0">
  <value name="name">generateSearchCondition</value>
  <array name="sig" type="value" depth="1">
    <value>[i] field:0:optional service_id</value>
    <value>[i] field:0:optional consumer_id</value>
    <value>[i] field:0:optional search_field1</value>
    <value>[i] field:0:optional search_field2</value>
    <value>[i] field:0:optional transaction_id</value>
    <value>[i] field:0:optional audit_type</value>
    <value>[i] field:0:optional status</value>
    <value>[i] field:0:optional date_from</value>
    <value>[i] field:0:optional date_to</value>
    <value>[i] field:0:required search_type {"AND","OR"}</value>
    <value>[o] field:0:required search_condition</value>
  </array>
  <value name="sigtype">java 3.5</value>
  <value name="encodeutf8">true</value>
  <value name="body">Ly8gcGlwZWxpbmUNCklEYXRhQ3Vyc29yIHBpcGVsaW5lQ3Vyc29yID0gcGlwZWxpbmUuZ2V0Q3Vy
c29yKCk7DQoJU3RyaW5nCVNlcnZpY2VJRCA9IElEYXRhVXRpbC5nZXRTdHJpbmcoIHBpcGVsaW5l
Q3Vyc29yLCAic2VydmljZV9pZCIgKTsNCglTdHJpbmcJQ29uc3VtZXJJRCA9IElEYXRhVXRpbC5n
ZXRTdHJpbmcoIHBpcGVsaW5lQ3Vyc29yLCAiY29uc3VtZXJfaWQiICk7DQoJU3RyaW5nCVNlYXJj
aEZpZWxkMSA9IElEYXRhVXRpbC5nZXRTdHJpbmcoIHBpcGVsaW5lQ3Vyc29yLCAic2VhcmNoX2Zp
ZWxkMSIgKTsNCglTdHJpbmcJU2VhcmNoRmllbGQyID0gSURhdGFVdGlsLmdldFN0cmluZyggcGlw
ZWxpbmVDdXJzb3IsICJzZWFyY2hfZmllbGQyIiApOw0KCVN0cmluZwlUcmFuc2FjdGlvbklEID0g
SURhdGFVdGlsLmdldFN0cmluZyggcGlwZWxpbmVDdXJzb3IsICJ0cmFuc2FjdGlvbl9pZCIgKTsN
CglTdHJpbmcJU3RhdHVzID0gSURhdGFVdGlsLmdldFN0cmluZyggcGlwZWxpbmVDdXJzb3IsICJz
dGF0dXMiICk7DQoJU3RyaW5nCUF1ZGl0VHlwZSA9IElEYXRhVXRpbC5nZXRTdHJpbmcoIHBpcGVs
aW5lQ3Vyc29yLCAiYXVkaXRfdHlwZSIgKTsNCglTdHJpbmcJYXVkaXRUaW1lU3RhbXBGcm9tRGF0
ZSA9IElEYXRhVXRpbC5nZXRTdHJpbmcoIHBpcGVsaW5lQ3Vyc29yLCAiZGF0ZV9mcm9tIiApOw0K
CVN0cmluZwlhdWRpdFRpbWVTdGFtcFRvRGF0ZSA9IElEYXRhVXRpbC5nZXRTdHJpbmcoIHBpcGVs
aW5lQ3Vyc29yLCAiZGF0ZV90byIgKTsNCglTdHJpbmcJc2VhcmNoX3R5cGUgPSBJRGF0YVV0aWwu
Z2V0U3RyaW5nKCBwaXBlbGluZUN1cnNvciwgInNlYXJjaF90eXBlIiApOw0KCUhhc2hNYXA8U3Ry
aW5nLFN0cmluZz4gZmllbGRzPW5ldyBIYXNoTWFwPFN0cmluZyxTdHJpbmc+KCk7DQoJU3RyaW5n
IHNlYXJjaF9jb25kaXRpb249IiAiOw0KcGlwZWxpbmVDdXJzb3IuZGVzdHJveSgpOw0KaWYoU2Vy
dmljZUlEICE9bnVsbCAmJiAhU2VydmljZUlELmVxdWFscygiIikpDQp7DQoJZmllbGRzLnB1dCgi
QS5TRVJWSUNFX0lEIiwgU2VydmljZUlEKTsNCiANCn0NCg0KDQppZihDb25zdW1lcklEICE9bnVs
bCAmJiAhQ29uc3VtZXJJRC5lcXVhbHMoIiIpKQ0Kew0KCWZpZWxkcy5wdXQoIkEuQ09OU1VNRVJf
SUQiLCBDb25zdW1lcklEKTsNCiANCn0NCg0KaWYoU2VhcmNoRmllbGQxICE9bnVsbCAmJiAhU2Vh
cmNoRmllbGQxLmVxdWFscygiIikpDQp7DQoJZmllbGRzLnB1dCgiQS5TRUFSQ0hfRklFTEQxIiwg
U2VhcmNoRmllbGQxKTsNCiANCn0NCmlmKFNlYXJjaEZpZWxkMiAhPW51bGwgJiYgIVNlYXJjaEZp
ZWxkMi5lcXVhbHMoIiIpKQ0Kew0KCWZpZWxkcy5wdXQoIkEuU0VBUkNIX0ZJRUxEMiIsIFNlYXJj
aEZpZWxkMik7DQogDQp9DQppZihUcmFuc2FjdGlvbklEICE9bnVsbCAmJiAgIVRyYW5zYWN0aW9u
SUQuZXF1YWxzKCIiKSkNCnsNCglmaWVsZHMucHV0KCJCLlRSQU5TQUNUSU9OX0lEIiwgVHJhbnNh
Y3Rpb25JRCk7DQogDQp9DQppZihTdGF0dXMgIT1udWxsICYmICFTdGF0dXMuZXF1YWxzKCIiKSkN
CnsNCglmaWVsZHMucHV0KCJCLlNUQVRVUyIsIFN0YXR1cyk7DQogDQp9DQppZihBdWRpdFR5cGUg
IT1udWxsICYmICFBdWRpdFR5cGUuZXF1YWxzKCIiKSkNCnsNCglmaWVsZHMucHV0KCJCLkFVRElU
X1RZUEUiLCBBdWRpdFR5cGUpOw0KIA0KfQ0KaWYoYXVkaXRUaW1lU3RhbXBGcm9tRGF0ZSAhPW51
bGwgJiYgIWF1ZGl0VGltZVN0YW1wRnJvbURhdGUuZXF1YWxzKCIiKSkNCnsNCgkvL2ZpZWxkcy5w
dXQoIkFVRElUX1RJTUVTVEFNUCIsIGF1ZGl0VGltZVN0YW1wRnJvbURhdGUpOw0KCXNlYXJjaF9j
b25kaXRpb249c2VhcmNoX2NvbmRpdGlvbisiIEIuQVVESVRfVElNRVNUQU1QIEJFVFdFRU4gJyIr
YXVkaXRUaW1lU3RhbXBGcm9tRGF0ZSsiJyBBTkQgIjsNCgkvLyBxdWVyeT1xdWVyeSsiIEFVRElU
X1RJTUVTVEFNUCBCRVRXRUVOICciK2F1ZGl0VGltZVN0YW1wRnJvbURhdGUrIicgQU5EICI7DQoJ
aWYgKGF1ZGl0VGltZVN0YW1wVG9EYXRlICE9bnVsbCAmJiAhYXVkaXRUaW1lU3RhbXBUb0RhdGUu
ZXF1YWxzKCIiKSApDQoJew0KCQlpZihmaWVsZHMuc2l6ZSgpPjApDQoJCQlzZWFyY2hfY29uZGl0
aW9uPXNlYXJjaF9jb25kaXRpb24rIiciK2F1ZGl0VGltZVN0YW1wVG9EYXRlKyInICIrc2VhcmNo
X3R5cGU7DQoJCWVsc2UNCgkJCXNlYXJjaF9jb25kaXRpb249c2VhcmNoX2NvbmRpdGlvbisiJyIr
YXVkaXRUaW1lU3RhbXBUb0RhdGUrIiciOw0KCX0NCgllbHNlIA0KCXsNCgkJU2ltcGxlRGF0ZUZv
cm1hdCBzZGZEYXRlID0gbmV3IFNpbXBsZURhdGVGb3JtYXQoInl5eXktTU0tZGQgSEg6bW06c3M6
U1NTIik7Ly9kZC9NTS95eXl5DQoJICAgIERhdGUgbm93ID0gbmV3IERhdGUoKTsNCgkgICAgU3Ry
aW5nIHN0ckRhdGUgPSBzZGZEYXRlLmZvcm1hdChub3cpOw0KCSAgICAvL2ZpZWxkcy5wdXQoImF1
ZGl0VGltZVN0YW1wVG9EYXRlIiwgc3RyRGF0ZSk7DQoJICAgIGlmKGZpZWxkcy5zaXplKCk+MCkN
CgkgICAgCXNlYXJjaF9jb25kaXRpb249c2VhcmNoX2NvbmRpdGlvbisiJyIrc3RyRGF0ZSsiJyAi
K3NlYXJjaF90eXBlOy8vcXVlcnk9cXVlcnkrIiciK2F1ZGl0VGltZVN0YW1wVG9EYXRlKyInICIr
c2VhcmNoQ29uZGl0aW9uOw0KCQkJZWxzZQ0KCQkJCXNlYXJjaF9jb25kaXRpb249c2VhcmNoX2Nv
bmRpdGlvbisiJyIrc3RyRGF0ZSsiJyAiOw0KCX0NCgkJIA0KfQ0KaWYgKGF1ZGl0VGltZVN0YW1w
VG9EYXRlICE9bnVsbCAmJiAhYXVkaXRUaW1lU3RhbXBUb0RhdGUuZXF1YWxzKCIiKSApDQp7DQoJ
aWYoYXVkaXRUaW1lU3RhbXBGcm9tRGF0ZSA9PW51bGwgfHwgYXVkaXRUaW1lU3RhbXBGcm9tRGF0
ZS5lcXVhbHMoIiIpKQ0KCXsNCgkJdGhyb3cgbmV3IFNlcnZpY2VFeGNlcHRpb24oImF1ZGl0VGlt
ZVN0YW1wRnJvbURhdGUgc2hvdWxkIGJlIHBhc3NlZCIpOyAgDQoJfQ0KCSANCn0NCgkNCmlmKGZp
ZWxkcy5zaXplKCk+MCkNCnsNCgkvKmlmKHNlYXJjaENvbmRpdGlvbiAhPW51bGwgfHwgIXNlYXJj
aENvbmRpdGlvbi5lcXVhbHMoIiIpKQ0KCXsNCgkJdGhyb3cgbmV3IFNlcnZpY2VFeGNlcHRpb24o
InNlYXJjaENvbmRpdGlvbiBjb25kaXRpb24gVmFsdWUgc2hvdWxkIG5vdCBiZSBlbXB0eSBvciBu
dWxsIik7ICANCgl9Ki8NCglTdHJpbmdbXSBjb2x1bW5zPW5ldyBTdHJpbmdbZmllbGRzLnNpemUo
KV07DQoJY29sdW1ucz0oU3RyaW5nW10pIGZpZWxkcy5rZXlTZXQoKS50b0FycmF5KG5ldyBTdHJp
bmdbMF0pOw0KCWZvcihTdHJpbmcgY29sdW1uOmNvbHVtbnMpDQoJew0KCQlpZihjb2x1bW4uZXF1
YWxzKGNvbHVtbnNbZmllbGRzLnNpemUoKS0xXSkpDQoJCXsNCgkJCXNlYXJjaF9jb25kaXRpb249
c2VhcmNoX2NvbmRpdGlvbisiICIrY29sdW1uKyI9JyIrZmllbGRzLmdldChjb2x1bW4pKyInIjsN
CgkJfQ0KCQllbHNlDQoJCXsNCgkJCXNlYXJjaF9jb25kaXRpb249c2VhcmNoX2NvbmRpdGlvbisi
ICIrY29sdW1uKyI9JyIrZmllbGRzLmdldChjb2x1bW4pKyInICIrIHNlYXJjaF90eXBlOw0KCQl9
DQoJfQ0KfQ0KDQovLyBwaXBlbGluZQ0KDQovLyBwaXBlbGluZQ0KDQpJRGF0YUN1cnNvciBvdXRw
dXRQaXBlbGluZUN1cnNvciA9IHBpcGVsaW5lLmdldEN1cnNvcigpOw0KDQovLyBhdWRpdERhdGFS
ZXNwb25zZQ0KDQpJRGF0YVV0aWwucHV0KG91dHB1dFBpcGVsaW5lQ3Vyc29yLCAic2VhcmNoX2Nv
bmRpdGlvbiIsIHNlYXJjaF9jb25kaXRpb24pOw0KDQpvdXRwdXRQaXBlbGluZUN1cnNvci5kZXN0
cm95KCk7DQoJDQo=</value>
</Values>
