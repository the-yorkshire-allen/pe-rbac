# @summary Configure Puppet Enterprise RBAC SAML against MockSAML.
#
# @example
#   class { 'conductor_rbac::profile::mocksaml': }
#
# @param display_name
#   Friendly name shown in the PE console for the MockSAML identity provider.
#
# @param idp_sso_url
#   MockSAML SSO endpoint.
#
# @param idp_entity_id
#   MockSAML entity ID published in its metadata.
#
# @param idp_certificate
#   MockSAML signing certificate from the public metadata endpoint.
#
# @param want_messages_signed
#   Whether PE should require signed SAML messages.
#
# @param want_assertions_signed
#   Whether PE should require signed SAML assertions.
#
# @param sign_metadata
#   Whether PE should sign its SP metadata.
#
# @param signature_algorithm
#   Signature algorithm used for SAML signing operations.
#
# @param user_lookup_attr
#   SAML attribute used to identify the user login.
#
# @param user_email_attr
#   SAML attribute used to populate the user email address.
#
# @param user_display_name_attr
#   SAML attribute used to populate the user display name.
#
# @param group_lookup_attr
#   SAML attribute used to populate group membership.
class conductor_rbac::profile::mocksaml (
  String $display_name = 'MockSAML Test Identity Provider',
  String $idp_sso_url = 'https://mocksaml.com/api/saml/sso',
  String $idp_entity_id = 'https://saml.example.com/entityid',
  Array[String] $idp_certificate = [
    'MIIC4jCCAcoCCQC33wnybT5QZDANBgkqhkiG9w0BAQsFADAyMQswCQYDVQQGEwJVUzEPMA0GA1UECgwGQm94eUhR' +
    'MRIwEAYDVQQDDAlNb2NrIFNBTUwwIBcNMjIwMjI4MjE0NjM4WhgPMzAyMTA3MDEyMTQ2MzhaMDIxCzAJBgNVBAYT' +
    'AlVTMQ8wDQYDVQQKDAZCb3h5SFExEjAQBgNVBAMMCU1vY2sgU0FNTDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC' +
    'AQoCggEBALGfYettMsct1T6tVUwTudNJH5Pnb9GGnkXi9Zw/e6x45DD0RuRONbFlJ2T4RjAE/uG+AjXxXQ8o2SZf' +
    'b9+GgmCHuTJFNgHoZ1nFVXCmb/Hg8HpdXWnPBrNQfB2zdD6jY8W1S5QkP4yQ8WmSNBjRsVnxkAbMEbZJwqgJzFhS4' +
    'fY4dY4c0A4qHB4hgFh0rM7Q2wJ8f7w13mJmZ3h5w5V1mCjLrN3g4vOAGXndixaReOiq3EH5XvpMjMkJ3+8+9VYMzM' +
    'ZOjkgQtAqO36eAFFfNKX7dTj3VpwLkvz6/KFCq8OAwY+AUi4eZm5J57D31GzjHwfjH9WTeX0MyndmnNB1qV75qQR3' +
    'b2/W5sGHRv+9AarggJkF+ptUkXoLtVA51wcfYm6hILptpde5FQC8RWY1YrswBWAEZNfyrR4JeSweElNHg4NVOs4Tw' +
    'GjOPwWGqzTfgTlECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAYRlYflSXAWoZpFfwNiCQVE5d9zZ0DPzNdWhAybX' +
    'cTyMf0z5mDf6FWBW5Gyoi9u3EMEDnzLcJNkwJAAc39Apa4I2/tml+Jy29dk8bTyX6m93ngmCgdLh5Za4khuU3AM3' +
    'L63g7VexCuO7kwkjh/+LqdcIXsVGO6XDfu2QOs1Xpe9zIzLpwm/RNYeXUjbSj5ce/jekpAw7qyVVL4xOyh8AtUW1' +
    'ek3wIw1MJvEgEPt0d16oshWJpoS1OT8Lr/22SvYEo3EmSGdTVGgk3x3s+A0qWAqTcyjr7Q4s/GKYRFfomGwz0TZ4' +
    'Iw1ZN99Mm0eo2USlSRTVl7QHRTuiuSThHpLKQQ==',
  ],
  Boolean $want_messages_signed = true,
  Boolean $want_assertions_signed = true,
  Boolean $sign_metadata = true,
  String $signature_algorithm = 'rsa-sha256',
  String $user_lookup_attr = 'login',
  String $user_email_attr = 'email',
  String $user_display_name_attr = 'display_name',
  String $group_lookup_attr = 'groups',
) {
  # Configure PE to use the public MockSAML test identity provider.
  rbac_saml { 'saml':
    ensure                 => present,
    display_name           => $display_name,
    idp_sso_url            => $idp_sso_url,
    idp_entity_id          => $idp_entity_id,
    idp_certificate        => $idp_certificate,
    want_messages_signed   => $want_messages_signed,
    want_assertions_signed => $want_assertions_signed,
    sign_metadata          => $sign_metadata,
    signature_algorithm    => $signature_algorithm,
    user_lookup_attr       => $user_lookup_attr,
    user_email_attr        => $user_email_attr,
    user_display_name_attr => $user_display_name_attr,
    group_lookup_attr      => $group_lookup_attr,
  }
}
