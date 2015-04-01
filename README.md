# fluent-plugin-to_s [![Gem Version](https://badge.fury.io/rb/fluent-plugin-to_s.svg)](http://badge.fury.io/rb/fluent-plugin-to_s)

Plugin that adds whole record to to_s field

## Installation

```bash
gem install fluent-plugin-to_s
```

## Usage

```xml
<match test.**>
  type to_s
  tag_prefix string
  field_name to_string
</match>
```

### following inputs are coming:

```
test.hoge {"data":"wef"}
```

### then output becomes as belows

```
string.test.hoge {"data":"wef", "to_string":"{\"data\":\"wef\"}"}
```
