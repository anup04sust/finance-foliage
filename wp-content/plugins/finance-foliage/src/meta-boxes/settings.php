<?php
$options = get_option('finance_foliage_settings');
return [
    'title'  => 'Settings',
    'id'     => 'finance_foliage_settings_fields',
    'settings_pages' => 'finance_foliage_settings',
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
            'group_title' => '{level}',
            'std' => $options['finance_foliage_levels'],
            'fields'     => [
                [
                    'type' => 'text',
                    'id'   => 'level',
                    'name' => esc_attr__('Level', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
                [
                    'type' => 'text',
                    'id'   => 'left_node',
                    'name' => esc_attr__('Left Node', 'finance-foliage'),
                    'attributes' => [
                        'class' => 'form-control'
                    ]
                ],
                [
                    'type' => 'text',
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
        ]
    ],
];