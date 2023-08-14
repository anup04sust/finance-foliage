
<?php
add_filter( 'rwmb_meta_boxes', 'your_prefix_register_meta_boxes' );

function your_prefix_register_meta_boxes( $meta_boxes ) {
    $prefix = '';

    $meta_boxes[] = [
        'title'   => esc_html__( 'Untitled Field Group', 'online-generator' ),
        'id'      => 'untitled',
        'context' => 'normal',
        'fields'  => [
            [
                'type'       => 'text',
                'name'       => esc_html__( 'Agent Name', 'online-generator' ),
                'id'         => $prefix . 'agent_name',
                'before'     => '<div class="custom">',
                'after'      => '</div>',
                'class'      => 'form-control',
                'attributes' => [
                    'test' => 'i am here',
                ],
            ],
            [
                'type' => 'number',
                'name' => esc_html__( 'Agent CID', 'online-generator' ),
                'id'   => $prefix . 'agent_cid',
            ],
            [
                'type' => 'text',
                'name' => esc_html__( 'Reference Token', 'online-generator' ),
                'id'   => $prefix . 'reference_token',
            ],
            [
                'type' => 'select',
                'name' => esc_html__( 'Referral agent', 'online-generator' ),
                'id'   => $prefix . 'referral_agent',
            ],
            [
                'type'    => 'radio',
                'name'    => esc_html__( 'Radio', 'online-generator' ),
                'id'      => $prefix . 'radio_4bihaat9207',
                'options' => [
                    'Left'  => esc_html__( 'Left', 'online-generator' ),
                    'Right' => esc_html__( 'Right', 'online-generator' ),
                ],
            ],
        ],
    ];

    return $meta_boxes;
}