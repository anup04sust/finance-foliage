<?php
$options = get_option('finance_foliage_settings');
return [
    'title'  => 'Settings',
    'id'     => 'finance_foliage_settings_fields',
    'settings_pages' => 'finance_foliage_settings',
    'tabs'      => [
        'settings' => esc_attr__('Level Settings', 'finance-foliage'),
        'bill'  => esc_attr__('Bill duration', 'finance-foliage'),
    ],
    'fields' => [
        [
            'id'         => 'finance_foliage_levels',
            'type'       => 'group',
            'name'       => esc_attr__('Add levels', 'finance-foliage'),
            'clone'      => true,
            'sort_clone' => false,
            'collapsible' => true,
            'save_state' => true,
            'default_state' => 'collapsed',
            'group_title' => 'Level {level}',
            'tab' => 'settings',
            'std' => $options['finance_foliage_levels'],
            'fields'     => [
                [
                    'type' => 'number',
                    'id'   => 'level',
                    'name' => esc_attr__('Level', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
                [
                    'type' => 'number',
                    'id'   => 'left_node',
                    'name' => esc_attr__('Left Node', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
                [
                    'type' => 'number',
                    'id'   => 'right_node',
                    'name' => esc_attr__('Right Node', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
                [
                    'type' => 'number',
                    'id'   => 'level_amount',
                    'name' => esc_attr__('Level Amount', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
            ]
        ],
        [
            'type' => 'select',
            'id'   => 'bill_duration',
            'name' => esc_attr__('Bill duration', 'finance-foliage'),
            'options' => [
                'daily' => esc_attr__('Daily', 'finance-foliage'),
                'weekly' => esc_attr__('Weekly', 'finance-foliage'),
                'monthly' => esc_attr__('Monthly', 'finance-foliage'),
            ],

            'std' => isset($options['bill_duration']) ? $options['bill_duration'] : 'weekly',

            'attributes' => [
                'class' => 'form-control'
            ],
            'tab' => 'bill',
        ],
        [
            'type' => 'select',
            'id'   => 'bill_week_start_day',
            'name' => esc_attr__('Start day', 'finance-foliage'),
            'options' => [
                '1' => esc_attr__('Sunday', 'finance-foliage'),
                '2' => esc_attr__('Monday', 'finance-foliage'),
                '3' => esc_attr__('Tuesday', 'finance-foliage'),
                '4' => esc_attr__('Wednesday', 'finance-foliage'),
                '5' => esc_attr__('Thursday', 'finance-foliage'),
                '6' => esc_attr__('Friday', 'finance-foliage'),
                '7' => esc_attr__('Saturday', 'finance-foliage'),
            ],
            'std' => isset($options['bill_week_start_day']) ? $options['bill_week_start_day'] : '0',
            'visible' => [ 'bill_duration', '=', 'weekly' ],
            'attributes' => [
                'class' => 'form-control'
            ],
            'tab' => 'bill',
        ],
    ],
];