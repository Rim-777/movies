# frozen_string_literal: true

module Movies
  SCHEMA = {
    'type' => 'object',
    'required' => %w[
      data included links
    ],
    'additionalProperties' => false,
    'properties' => {
      'data' => {
        'type' => 'array',
        'items' => {
          'type' => 'object',
          'required' => %w[
            id type attributes relationships
          ],
          'properties' => {
            'id' => {
              'type' => 'string'
            },
            'type' => {
              'type' => 'string',
              'enum' => ['movie']
            },
            'attributes' => {
              'type' => 'object',
              'required' => %w[
                name
                description
                year
              ],
              'properties' => {
                'name' => {
                  'type' => 'string'
                },
                'description' => {
                  'type' => 'string'
                },
                'year' => {
                  'type' => 'string'
                }
              }
            },
            'relationships' => {
              'type' => 'object',
              'required' => %w[
                actors
                directors
                countries
                filming_locations
                reviews
              ],
              'properties' => {
                'actors' => {
                  'type' => 'object',
                  'required' => [
                    'data'
                  ],
                  'properties' => {
                    'data' => {
                      'type' => 'array',
                      'items' => {
                        'type' => 'object',
                        'required' => %w[
                          id type
                        ],
                        'properties' => {
                          'id' => {
                            'type' => 'string'
                          },
                          'type' => {
                            'type' => 'string',
                            'enum' => ['actor']
                          }
                        }
                      }
                    }
                  }
                },
                'directors' => {
                  'type' => 'object',
                  'required' => [
                    'data'
                  ],
                  'properties' => {
                    'data' => {
                      'type' => 'array',
                      'items' => {
                        'type' => 'object',
                        'required' => %w[
                          id type
                        ],
                        'properties' => {
                          'id' => {
                            'type' => 'string'
                          },
                          'type' => {
                            'type' => 'string',
                            'enum' => ['director']
                          }
                        }
                      }
                    }
                  }
                },
                'countries' => {
                  'type' => 'object',
                  'required' => [
                    'data'
                  ],
                  'properties' => {
                    'data' => {
                      'type' => 'array',
                      'items' => {
                        'type' => 'object',
                        'required' => %w[
                          id type
                        ],
                        'properties' => {
                          'id' => {
                            'type' => 'string'
                          },
                          'type' => {
                            'type' => 'string',
                            'enum' => 'country'
                          }
                        }
                      }
                    }
                  }
                },
                'filming_locations' => {
                  'type' => 'object',
                  'required' => [
                    'data'
                  ],
                  'properties' => {
                    'data' => {
                      'type' => 'array',
                      'items' => {
                        'type' => 'object',
                        'required' => %w[
                          id type
                        ],
                        'properties' => {
                          'id' => {
                            'type' => 'string'
                          },
                          'type' => {
                            'type' => 'string',
                            'enum' => ['filming_location']
                          }
                        }
                      }
                    }
                  }
                },
                'reviews' => {
                  'type' => 'object',
                  'required' => [
                    'data'
                  ],
                  'properties' => {
                    'data' => {
                      'type' => 'array',
                      'items' => {
                        'type' => 'object',
                        'required' => %w[
                          id type
                        ],
                        'properties' => {
                          'id' => {
                            'type' => 'string'
                          },
                          'type' => {
                            'type' => 'string',
                            'enum' => ['review']
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      'included' => {
        'type' => 'array',
        'items' => {
          'oneOf' => [
            {
              'type' => 'object',
              'required' => %w[id type attributes],
              'properties' => {
                'id' => {
                  'type' => 'string'
                },
                'type' => {
                  'type' => 'string',
                  'enum' => %w[actor]
                },
                'attributes' => {
                  'type' => 'object',
                  'required' => ['name'],
                  'properties' => {
                    'name' => {
                      'type' => 'string'
                    }
                  }
                }
              }
            },
            {
              'type' => 'object',
              'required' => %w[id type attributes],
              'properties' => {
                'id' => {
                  'type' => 'string'
                },
                'type' => {
                  'type' => 'string',
                  'enum' => %w[director]
                },
                'attributes' => {
                  'type' => 'object',
                  'required' => ['name'],
                  'properties' => {
                    'name' => {
                      'type' => 'string'
                    }
                  }
                }
              }
            },
            {
              'type' => 'object',
              'required' => %w[id type attributes],
              'properties' => {
                'id' => {
                  'type' => 'string'
                },
                'type' => {
                  'type' => 'string',
                  'enum' => %w[country]
                },
                'attributes' => {
                  'type' => 'object',
                  'required' => ['name'],
                  'properties' => {
                    'name' => {
                      'type' => 'string'
                    }
                  }
                }
              }
            },
            {
              'type' => 'object',
              'required' => %w[id type attributes],
              'properties' => {
                'id' => {
                  'type' => 'string'
                },
                'type' => {
                  'type' => 'string',
                  'enum' => %w[filming_location]
                },
                'attributes' => {
                  'type' => 'object',
                  'required' => ['name'],
                  'properties' => {
                    'name' => {
                      'type' => 'string'
                    }
                  }
                }
              }
            },
            {
              'type' => 'object',
              'required' => %w[id type attributes relationships],
              'properties' => {
                'id' => {
                  'type' => 'string'
                },
                'type' => {
                  'type' => 'string',
                  'enum' => %w[review]
                },
                'attributes' => {
                  'type' => 'object',
                  'required' => %w[review_text stars],
                  'properties' => {
                    'review_text' => {
                      'type' => 'string'
                    },
                    'stars' => {
                      'type' => 'integer'
                    }
                  }
                },
                'relationships' => {
                  'type' => 'object',
                  'required' => %w[user],
                  'properties' => {
                    'user' => {
                      'type' => 'object',
                      'required' => %w[data],
                      'properties' => {
                        'data' => {
                          'type' => 'object',
                          'required' => %w[id type],
                          'properties' => {
                            'id' => {
                              'type' => 'string'
                            },
                            'type' => {
                              'type' => 'string',
                              'enum' => %w[user]
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          ]
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
