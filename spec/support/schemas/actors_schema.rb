# frozen_string_literal: true

module Actors
  SCHEMA = {
    'type' => 'object',
    'required' => %w[
      data links
    ],
    'additionalProperties' => false,
    'properties' => {
      'data' => {
        'type' => 'array',
        'items' => {
          'type' => 'object',
          'required' => %w[
            id type attributes
          ],
          'properties' => {
            'id' => {
              'type' => 'string'
            },
            'type' => {
              'type' => 'string',
              'enum' => ['actor']
            },
            'attributes' => {
              'type' => 'object',
              'required' => %w[
                name
              ],
              'properties' => {
                'name' => {
                  'type' => 'string'
                }
              }
            }
          }
        }
      },
      'links' => {
        'type' => 'object',
        'required' => %w[first last],
        'properties' => {
          'first' => {
            'type' => 'string'
          },
          'last' => {
            'type' => 'string'
          },
          'prev' => {
            'type' => 'string'
          },
          'next' => {
            'type' => 'string'
          }
        }
      }
    }
  }.freeze
end
