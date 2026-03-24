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
class profile::mocksaml (
  String $display_name = '',
  String $idp_sso_url = '',
  String $idp_slo_url = '',
  String $idp_entity_id = '',
  Optional[Array[String]] $idp_certificate = undef,
  Boolean $want_messages_signed = true,
  Boolean $want_assertions_signed = true,
  Boolean $sign_metadata = true,
  Boolean $want_assertions_encrypted = false,
  Boolean $want_name_id_encrypted = false,
  Boolean $allow_duplicated_attribute_name = false,
  Boolean $want_xml_validation = true,
  String $signature_algorithm = 'rsa-sha256',
  String $requested_authn_context_comparison = 'exact',
  String $requested_auth_context = 'urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport',
  String $technical_support_name = 'PE Technical Support',
  String $technical_support_email = 'tech-support@example.com',
  String $support_name = 'PE Support',
  String $support_email_address = 'support@example.com',
  String $user_lookup_attr = 'login',
  String $user_email_attr = 'email',
  String $user_display_name_attr = 'display_name',
  String $group_lookup_attr = 'groups',
) {
  # Configure PE to use the public MockSAML test identity provider.
  rbac_saml { 'saml':
    ensure                             => present,
    display_name                       => $display_name,
    idp_sso_url                        => $idp_sso_url,
    idp_slo_url                        => $idp_slo_url,
    idp_entity_id                      => $idp_entity_id,
    idp_certificate                    => $idp_certificate,
    want_messages_signed               => $want_messages_signed,
    want_assertions_signed             => $want_assertions_signed,
    sign_metadata                      => $sign_metadata,
    want_assertions_encrypted          => $want_assertions_encrypted,
    want_name_id_encrypted             => $want_name_id_encrypted,
    allow_duplicated_attribute_name    => $allow_duplicated_attribute_name,
    want_xml_validation                => $want_xml_validation,
    signature_algorithm                => $signature_algorithm,
    requested_authn_context_comparison => $requested_authn_context_comparison,
    requested_auth_context             => $requested_auth_context,
    technical_support_name             => $technical_support_name,
    technical_support_email            => $technical_support_email,
    support_name                       => $support_name,
    support_email_address              => $support_email_address,
    user_lookup_attr                   => $user_lookup_attr,
    user_email_attr                    => $user_email_attr,
    user_display_name_attr             => $user_display_name_attr,
    group_lookup_attr                  => $group_lookup_attr,
  }
}
