# frozen_string_literal: true

module API
  module V2
    module Public
      module Entities
        class Currency < Base
          expose(
            :id,
            documentation: {
              desc: 'Currency code.',
              type: String,
              values: -> { ::Currency.visible.codes },
              example: -> { ::Currency.visible.first.id }
            }
          )

          expose(
            :name,
            documentation: {
                type: String,
                desc: 'Currency name',
                example: -> { ::Currency.visible.first.name }
            },
            if: -> (currency){ currency.name.present? }
          )

          expose(
            :description,
            documentation: {
              type: String,
              desc: 'Currency description',
              example: -> { ::Currency.visible.first.description }
            }
          )

          expose(
            :homepage,
            documentation: {
              type: String,
              desc: 'Currency homepage',
              example: -> { ::Currency.visible.first.homepage }
            }
          )

          expose(
            :parent_id,
            documentation: {
              type: String,
              desc: 'Currency parent id',
            },
            if: -> (currency){ currency.default_network.present?  }
          ) { |c| c.default_network.parent_id }

          expose(
            :price,
            documentation: {
              desc: 'Currency current price'
            }
          )

          expose(
            :explorer_transaction,
            documentation: {
              desc: 'Currency transaction exprorer url template',
              example: 'https://testnet.blockchain.info/tx/'
            },
            if: -> (currency){ currency.coin? && currency.default_network.present?  }
          )  { |c| c.default_network.blockchain.explorer_transaction }

          expose(
            :explorer_address,
            documentation: {
              desc: 'Currency address exprorer url template',
              example: 'https://testnet.blockchain.info/address/'
            },
            if: -> (currency){ currency.coin? && currency.default_network.present? }
          ) { |c| c.default_network.blockchain.explorer_address }

          expose(
            :type,
            documentation: {
              type: String,
              values: -> { ::Currency.types },
              desc: 'Currency type',
              example: -> { ::Currency.visible.first.type }
            }
          )

          expose(
            :deposit_enabled,
            documentation: {
              type: String,
              desc: 'Currency deposit possibility status (true/false).'
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.deposit_enabled }

          expose(
            :withdrawal_enabled,
            documentation: {
              type: String,
              desc: 'Currency withdrawal possibility status (true/false).'
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.withdrawal_enabled }

          expose(
            :deposit_fee,
            documentation: {
              desc: 'Currency deposit fee',
              example: -> { ::Currency.visible.first.deposit_fee }
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.deposit_fee }

          expose(
            :min_deposit_amount,
            documentation: {
              desc: 'Minimal deposit amount',
              example: -> { ::Currency.visible.first.min_deposit_amount }
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.min_deposit_amount }

          expose(
            :withdraw_fee,
            documentation: {
              desc: 'Currency withdraw fee',
              example: -> { ::Currency.visible.first.withdraw_fee }
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.withdraw_fee }

          expose(
            :min_withdraw_amount,
            documentation: {
              desc: 'Minimal withdraw amount',
              example: -> { ::Currency.visible.first.min_withdraw_amount }
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.min_withdraw_amount }

          expose(
            :base_factor,
            documentation: {
              desc: 'Currency base factor',
              example: -> { ::Currency.visible.first.base_factor }
            },
            if: -> (currency){ currency.default_network.present? }
          ) { |c| c.default_network.base_factor }

          expose(
            :precision,
            documentation: {
              desc: 'Currency precision',
              example: -> { ::Currency.visible.first.precision }
            }
          )

          expose(
            :position,
            documentation: {
              desc: 'Position used for defining currencies order',
              example: -> { ::Currency.visible.first.precision }
            }
          )

          expose(
            :icon_url,
            documentation: {
              desc: 'Currency icon',
              example: 'https://upload.wikimedia.org/wikipedia/commons/0/05/Ethereum_logo_2014.svg'
            },
            if: -> (currency){ currency.icon_url.present? }
          )

          expose(
            :min_confirmations,
            documentation: {
              desc: 'Number of confirmations required for confirming deposit or withdrawal'
            },
            if: -> (currency){ currency.coin? && currency.default_network.present? }
          ) { |c| c.default_network.blockchain.min_confirmations }
        end
      end
    end
  end
end
