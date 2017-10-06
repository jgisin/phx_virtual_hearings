defmodule VirtualHearingsWeb.Coherence.Messages do
  @moduledoc """
  Application facing messages generated by the Coherence application.

  This module was created by the coh.install mix task. It contains all the
  messages used in the coherence application except those in other generated
  files like the view and templates.

  To assist in upgrading Coherence, the `Coherence.Messages behaviour will
  alway contain every message for the current version.  This will help in upgrades
  to ensure the user had added new the new messages from the current version.
  """
  @behaviour Coherence.Messages

  import VirtualHearingsWeb.Gettext

  # Change this to override the "coherence" gettext domain. If you would like
  # the coherence message to be part of your projects domain change it to "default"
  @domain "coherence"

  ##################
  # Messages

  def account_already_confirmed, do: dgettext(@domain, "Account already confirmed.")
  def account_is_not_locked, do: dgettext(@domain, "Account is not locked.")
  def account_updated_successfully, do: dgettext(@domain, "Account updated successfully.")
  def already_confirmed, do: dgettext(@domain, "already confirmed")
  def already_locked, do: dgettext(@domain, "already locked")
  def already_logged_in, do: dgettext(@domain, "Already logged in.")
  def cant_be_blank, do: dgettext(@domain, "can't be blank")
  def cant_find_that_token, do: dgettext(@domain, "Can't find that token")
  def confirmation_email_sent, do: dgettext(@domain, "Confirmation email sent.")
  def confirmation_token_expired, do: dgettext(@domain, "Confirmation token expired.")
  def could_not_find_that_email_address, do: dgettext(@domain, "Could not find that email address")
  def forgot_your_password, do: dgettext(@domain, "Forgot your password?")
  def http_authentication_required, do: dgettext(@domain, "HTTP Authentication Required")
  def incorrect_login_or_password(opts), do: dgettext(@domain, "Incorrect %{login_field} or password.", opts)
  def invalid_current_password, do: dgettext(@domain, "invalid current password")
  def invalid_invitation, do: dgettext(@domain, "Invalid Invitation. Please contact the site administrator.")
  def invalid_request, do: dgettext(@domain, "Invalid Request.")
  def invalid_confirmation_token, do: dgettext(@domain, "Invalid confirmation token.")
  def invalid_email_or_password, do: dgettext(@domain, "Invalid email or password.")
  def invalid_invitation_token, do: dgettext(@domain, "Invalid invitation token.")
  def invalid_reset_token, do: dgettext(@domain, "Invalid reset token.")
  def invalid_unlock_token, do: dgettext(@domain, "Invalid unlock token.")
  def invitation_already_sent, do: dgettext(@domain, "Invitation already sent.")
  def invitation_sent, do: dgettext(@domain, "Invitation sent.")
  def invite_someone, do: dgettext(@domain, "Invite Someone")
  def maximum_login_attempts_exceeded, do: dgettext(@domain, "Maximum Login attempts exceeded. Your account has been locked.")
  def need_an_account, do: dgettext(@domain, "Need An Account?")
  def not_locked, do: dgettext(@domain, "not locked")
  def password_reset_token_expired, do: dgettext(@domain, "Password reset token expired.")
  def password_updated_successfully, do: dgettext(@domain, "Password updated successfully.")
  def problem_confirming_user_account, do: dgettext(@domain, "Problem confirming user account. Please contact the system administrator.")
  def registration_created_successfully, do: dgettext(@domain, "Registration created successfully.")
  def required, do: dgettext(@domain, "required")
  def resend_confirmation_email, do: dgettext(@domain, "Resend confirmation email")
  def reset_email_sent, do: dgettext(@domain, "Reset email sent. Check your email for a reset link.")
  def restricted_area, do: dgettext(@domain, "Restricted Area")
  def send_an_unlock_email, do: dgettext(@domain, "Send an unlock email")
  def sign_in, do: dgettext(@domain, "Sign In")
  def sign_out, do: dgettext(@domain, "Sign Out")
  def signed_in_successfully, do: dgettext(@domain, "Signed in successfully.")
  def too_many_failed_login_attempts, do: dgettext(@domain, "Too many failed login attempts. Account has been locked.")
  def unauthorized_ip_address, do: dgettext(@domain, "Unauthorized IP Address")
  def unlock_instructions_sent, do: dgettext(@domain, "Unlock Instructions sent.")
  def user_account_confirmed_successfully, do: dgettext(@domain, "User account confirmed successfully.")
  def user_already_has_an_account, do: dgettext(@domain, "User already has an account!")
  def you_must_confirm_your_account, do: dgettext(@domain, "You must confirm your account before you can login.")
  def your_account_has_been_unlocked, do: dgettext(@domain, "Your account has been unlocked")
  def your_account_is_not_locked, do: dgettext(@domain, "Your account is not locked.")
  def verify_user_token(opts),
    do: dgettext(@domain, "Invalid %{user_token} error: %{error}", opts)
  def you_are_using_an_invalid_security_token,
    do: dgettext(@domain, "You are using an invalid security token for this site! This security\n" <>
      "violation has been logged.\n")
  def mailer_required, do: dgettext(@domain, "Mailer configuration required!")
  def account_is_inactive(), do: dgettext(@domain, "Account is inactive!")
end
