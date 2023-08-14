import { InspectorControls, useBlockProps } from '@wordpress/block-editor';
import {
	PanelBody,
	PanelRow,
	TextControl,
	ToggleControl
} from '@wordpress/components';
import { __ } from '@wordpress/i18n';
import ServerSideRender from '@wordpress/server-side-render';
import './editor.scss';

export default function Edit( { attributes, setAttributes } ) {
	const {
		redirect,
		form_id,
		recaptcha_key,
		recaptcha_secret,
		label_title,
		label_username,
		label_password,
		label_remember,
		label_lost_password,
		label_submit,
		id_username,
		id_password,
		id_remember,
		id_submit,
		value_username,
		value_remember,
		confirmation,
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
							label={ __( 'Redirect URL', 'mb-user-profile' ) }
							help={ __( 'Redirect URL, to which users will be redirected after successful login.', 'mb-user-profile' ) }
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
							label={ __( 'Password field label', 'mb-user-profile' ) }
							value={ label_password }
							onChange={ ( value ) => setAttributes( { label_password: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Remember checkbox label', 'mb-user-profile' ) }
							value={ label_remember }
							onChange={ ( value ) => setAttributes( { label_remember: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Lost password field label', 'mb-user-profile' ) }
							value={ label_lost_password }
							onChange={ ( value ) => setAttributes( { label_lost_password: value } ) }
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
							label={ __( 'Password field ID', 'mb-user-profile' ) }
							value={ id_password }
							onChange={ ( value ) => setAttributes( { id_password: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Remember checkbox ID', 'mb-user-profile' ) }
							value={ id_remember }
							onChange={ ( value ) => setAttributes( { id_remember: value } ) }
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
							help={ __( 'Confirmation message if login is successful.', 'mb-user-profile' ) }
							value={ confirmation }
							onChange={ ( value ) => setAttributes( { confirmation: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Default username value', 'mb-user-profile' ) }
							help={ __( 'Default value for username field.', 'mb-user-profile' ) }
							value={ value_username }
							onChange={ ( value ) => setAttributes( { value_username: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<ToggleControl
							label={ __( 'Default remember', 'mb-user-profile' ) }
							help={ __( 'Default value for remember checkbox field - true or false (default).', 'mb-user-profile' ) }
							checked={ value_remember }
							onChange={ () => setAttributes( { value_remember: !value_remember } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Recaptcha key', 'mb-user-profile' ) }
							help={ __( 'Google reCaptcha site key (version 3).', 'mb-user-profile' ) }
							value={ recaptcha_key }
							onChange={ ( value ) => setAttributes( { recaptcha_key: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Recaptcha secret', 'mb-user-profile' ) }
							help={ __( 'Google reCaptcha secret key (version 3).', 'mb-user-profile' ) }
							value={ recaptcha_secret }
							onChange={ ( value ) => setAttributes( { recaptcha_secret: value } ) }
						/>
					</PanelRow>
				</PanelBody>
			</InspectorControls>
			<ServerSideRender
				block="meta-box/login-form"
				attributes={ attributes }
			/>
		</div>
	);
}
