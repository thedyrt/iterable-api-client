module Iterable
  ##
  #
  # Interact with /campaigns API endpoints
  #
  # @example Creating campaigns endpoint object
  #   # With default config
  #   campaigns = Iterable::Campaigns.new
  #   campaigns.all
  #
  #   # With custom config
  #   conf = Iterable::Config.new(token: 'new-token')
  #   campaigns = Iterable::Campaigns.new(config)
  class Campaigns < ApiResource
    ##
    #
    # Get all campaigns
    #
    # @return [Iterable::Response] A response object
    def all
      Iterable.request(conf, '/campaigns').get
    end

    ##
    #
    # Create a new campaign. Requires a name, templateId and at least one listId
    #
    # @param name [String] The name of the campaign
    # @param template_id [Integer] The templateId to use for the campaign
    # @param list_ids [Array] Array of listIds to use for the campaign
    # @param attrs [Hash] Any other campaign attributes to set
    #
    # @return [Iterable::Response] A response object
    def create(name, template_id, list_ids = [], attrs = {})
      body = attrs.merge(name: name, templateId: template_id, listIds: list_ids)
      Iterable.request(conf, '/campaigns/create').post(body)
    end
  end
end
