import { InspectorControls, useBlockProps } from '@wordpress/block-editor';
import {
	PanelBody,
	PanelRow,
	SelectControl,
	TextControl,
	ToggleControl
} from '@wordpress/components';
import { __ } from '@wordpress/i18n';
import ServerSideRender from '@wordpress/server-side-render';
import './editor.scss';

export default function Edit( { attributes, setAttributes } ) {
	const {
		meta_box_id,
		redirect,
		form_id,
		recaptcha_key,
		recaptcha_secret,
		label_title,
		label_username,
		label_email,
		label_password,
		label_password2,
		label_submit,
		id_username,
		id_email,
		id_password,
		id_password2,
		id_submit,
		confirmation,
		email_confirmation,
		password_strength,
		email_as_username,
		show_if_user_can,
		role,
		append_role
	} = attributes;

	let passwordStrength = [
		{
			label: 'Strong',
			value: 'strong'
		},
		{
			label: 'Medium',
			value: 'medium'
		},
		{
			label: 'Weak',
			value: 'weak'
		},
		{
			label: 'Very weak',
			value: 'very-weak'
		}
	];

	return (
		<div { ...useBlockProps() }>
			<InspectorControls>
				<PanelBody className="mbup-block" title={ __( 'Settings', 'mb-user-profile' ) }>
					<PanelRow>
						<TextControl
							label={ __( 'ID', 'mb-user-profile' ) }
							help={ __( 'Field group ID(s). If multiple field groups, enter their IDs separated by commas. Optional.', 'mb-user-profile' ) }
							value={ meta_box_id }
							onChange={ ( value ) => setAttributes( { meta_box_id: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Redirect URL', 'mb-user-profile' ) }
							help={ __( 'Redirect URL, to which users will be redirected after successful registration.', 'mb-user-profile' ) }
							value={ redirect }
							onChange={ ( value ) => setAttributes( { redirect: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Form ID', 'mb-user-profile' ) }
							value={ form_id }
							onChange={ ( value ) => setAttributes( { form_id: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Title', 'mb-user-profile' ) }
							value={ label_title }
							onChange={ ( value ) => setAttributes( { label_title: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Username field label', 'mb-user-profile' ) }
							value={ label_username }
							onChange={ ( value ) => setAttributes( { label_username: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Email field label', 'mb-user-profile' ) }
							value={ label_email }
							onChange={ ( value ) => setAttributes( { label_email: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Password field label', 'mb-user-profile' ) }
							value={ label_password }
							onChange={ ( value ) => setAttributes( { label_password: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Confirm password field label', 'mb-user-profile' ) }
							value={ label_password2 }
							onChange={ ( value ) => setAttributes( { label_password2: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Submit button text', 'mb-user-profile' ) }
							value={ label_submit }
							onChange={ ( value ) => setAttributes( { label_submit: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Username field ID', 'mb-user-profile' ) }
							value={ id_username }
							onChange={ ( value ) => setAttributes( { id_username: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Email field ID', 'mb-user-profile' ) }
							value={ id_email }
							onChange={ ( value ) => setAttributes( { id_email: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Password field ID', 'mb-user-profile' ) }
							value={ id_password }
							onChange={ ( value ) => setAttributes( { id_password: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Confirm password field ID', 'mb-user-profile' ) }
							value={ id_password2 }
							onChange={ ( value ) => setAttributes( { id_password2: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Submit button ID', 'mb-user-profile' ) }
							value={ id_submit }
							onChange={ ( value ) => setAttributes( { id_submit: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Confirmation text', 'mb-user-profile' ) }
							help={ __( 'Confirmation message if registration is successful.', 'mb-user-profile' ) }
							value={ confirmation }
							onChange={ ( value ) => setAttributes( { confirmation: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<ToggleControl
							label={ __( 'Send confirmation email', 'mb-user-profile' ) }
							help={ __( 'Send confirmation email when register (you need to setup an email SMTP to make this function work properly). If this param is true, system will also check confirmation status when user login. All previous users are set confirmed.', 'mb-user-profile' ) }
							checked={ email_confirmation }
							onChange={ () => setAttributes( { email_confirmation: !email_confirmation } ) }
						/>
					</PanelRow>
					<PanelRow>
						<SelectControl
							label={ __( 'Password strength', 'mb-user-profile' ) }
							value={ password_strength }
							options={ [
								{ label: __( '---', 'mb-user-profile' ), value: '' },
								...passwordStrength
							] }
							onChange={ ( value ) => setAttributes( { password_strength: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<ToggleControl
							label={ __( 'Use email for username', 'mb-user-profile' ) }
							checked={ email_as_username }
							onChange={ () => setAttributes( { email_as_username: !email_as_username } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Always show', 'mb-user-profile' ) }
							help={ __( 'Always show the form if the current user has a proper capability. Should be a WordPress capability. Useful if admins want to register for other people.', 'mb-user-profile' ) }
							value={ show_if_user_can }
							onChange={ ( value ) => setAttributes( { show_if_user_can: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Role for the new user', 'mb-user-profile' ) }
							help={ __( 'Role for the new user. If append_role is set to true, then the new role is appended, so users will have 2 roles: the default roles set by WordPress and this role. Default is empty.', 'mb-user-profile' ) }
							value={ role }
							onChange={ ( value ) => setAttributes( { role: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<ToggleControl
							label={ __( 'Append role', 'mb-user-profile' ) }
							help={ __( 'Whether to append the role to users instead of setting only one role for users.', 'mb-user-profile' ) }
							checked={ append_role }
							onChange={ () => setAttributes( { append_role: !append_role } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'reCaptcha key', 'mb-user-profile' ) }
							help={ __( 'Google reCaptcha site key (version 3).', 'mb-user-profile' ) }
							value={ recaptcha_key }
							onChange={ ( value ) => setAttributes( { recaptcha_key: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'reCaptcha secret', 'mb-user-profile' ) }
							help={ __( 'Google reCaptcha secret key (version 3).', 'mb-user-profile' ) }
							value={ recaptcha_secret }
							onChange={ ( value ) => setAttributes( { recaptcha_secret: value } ) }
						/>
					</PanelRow>
				</PanelBody>
			</InspectorControls>
			<ServerSideRender
				block="meta-box/registration-form"
				attributes={ attributes }
			/>
		</div>
	);
}
