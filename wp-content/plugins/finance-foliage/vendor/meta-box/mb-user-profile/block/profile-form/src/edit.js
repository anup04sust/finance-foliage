import { InspectorControls, useBlockProps } from '@wordpress/block-editor';
import {
	PanelBody,
	PanelRow,
	SelectControl,
	TextControl
} from '@wordpress/components';
import { __ } from '@wordpress/i18n';
import ServerSideRender from '@wordpress/server-side-render';
import './editor.scss';

export default function Edit( { attributes, setAttributes } ) {
	const {
		meta_box_id,
		user_id,
		redirect,
		form_id,
		recaptcha_key,
		recaptcha_secret,
		label_title,
		label_password,
		label_password2,
		label_submit,
		id_password,
		id_password2,
		id_submit,
		confirmation,
		password_strength
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
							help={ __( 'Field group ID(s), separated by commas. All fields from field groups will be included in the profile form. Required.', 'mb-user-profile' ) }
							value={ meta_box_id }
							onChange={ ( value ) => setAttributes( { meta_box_id: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'User ID', 'mb-user-profile' ) }
							help={ __( 'User ID, whose info will be edited. If not specified, current user ID is used.', 'mb-user-profile' ) }
							value={ user_id }
							onChange={ ( value ) => setAttributes( { user_id: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<TextControl
							label={ __( 'Redirect URL', 'mb-user-profile' ) }
							help={ __( 'Redirect URL, to which users will be redirected after successful submission.', 'mb-user-profile' ) }
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
							help={ __( 'Confirmation message if the form submission is successful.', 'mb-user-profile' ) }
							value={ confirmation }
							onChange={ ( value ) => setAttributes( { confirmation: value } ) }
						/>
					</PanelRow>
					<PanelRow>
						<SelectControl
							label={ __( 'Password strength', 'mb-user-profile' ) }
							value={ password_strength }
							options={ [
								{ label: __( '-- Choose password strength --', 'mb-user-profile' ), value: '' },
								...passwordStrength
							] }
							onChange={ ( value ) => setAttributes( { password_strength: value } ) }
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
				block="meta-box/profile-form"
				attributes={ attributes }
			/>
		</div>
	);
}
