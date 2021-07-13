defmodule EthereumRPC.Client.BaseClient do
  @moduledoc false

  # alias EthereumRPC.Client.Behaviour
  alias EthereumRPC.Counter

  defmacro __using__(_opts) do
    quote location: :keep do
      # @behaviour Behaviour

      @doc ""
      @impl true
      def web3_client_version(opts \\ []) do
        request("web3_clientVersion", [], opts)
      end

      @doc ""
      # @impl true
      def web3_sha3(data, opts \\ []) do
        params = [data]

        request("web3_sha3", params, opts)
      end

      @doc """
      Returns the chain ID associated with the current network.
      iex> {"id":1,"jsonrpc":"2.0","method":"net_version","params":[]}
      """
      # @impl true
      def net_version(opts \\ []) do
        request("net_version", [], opts)
      end

      @doc """
      Returns the number of peers currently connected to this client
      iex> {"id":1,"jsonrpc":"2.0","method":"net_peerCount","params":[]}
      """
      def net_peer_count(opts \\ []) do
        request("net_peerCount", [], opts)
      end


      @doc """
      Determines if this client is listening for new network connections
      iex> {"id":2,"jsonrpc":"2.0","method":"net_listening","params":[]}
      """
      # @impl true
      def net_listening(opts \\ []) do
        request("net_listening", [], opts)
      end

      @doc """
      Returns the current Ethereum protocol version
      iex> {"id":3,"jsonrpc":"2.0","method":"eth_protocolVersion","params":[]}
      """
      # @impl true
      def eth_protocol_version(opts \\ []) do
        request("eth_protocolVersion", [], opts)
      end

      @doc """
      Returns the current price of gas expressed in wei
      iex> {"id":2,"jsonrpc":"2.0","method":"eth_gasPrice","params":[]}
      """
      # @impl true
      def eth_gas_price(opts \\ []) do
        request("eth_gasPrice", [], opts)
      end

      @doc """
      Returns a list of addresses owned by this client
      iex> {"id":5,"jsonrpc":"2.0","method":"eth_accounts","params":[]}
      """
      # @impl true
      def eth_accounts(opts \\ []) do
        request("eth_accounts", [], opts)
      end

      @doc """
      Returns the number of the most recent block seen by this client
      iex> {"id":3,"jsonrpc":"2.0","method":"eth_blockNumber","params":[]}
      """
      # @impl true
      def eth_block_number(opts \\ []) do
        request("eth_blockNumber", [], opts)
      end

      @doc """
      Creates a filter in the node, to notify when a new block arrives. To check if the state has changed, call eth_getFilterChanges.
      iex> {"id":4,"jsonrpc":"2.0","method":"eth_newBlockFilter","params":[]}
      """
      # @impl true
      def eth_new_block_filter(opts \\ []) do
        request("eth_newBlockFilter", [], opts)
      end

      @doc """
      Returns the number of hashes-per-second this node is mining at
      iex> {"id":1,"jsonrpc":"2.0","method":"eth_hashrate","params":[]}
      """
      # @impl true
      def eth_hashrate(opts \\ []) do
        request("eth_hashrate", [], opts)
      end

      @doc """
      Returns an object with data about the sync status or false.
      iex> {"id":9,"jsonrpc":"2.0","method":"eth_syncing","params":[]}
      """
      # @impl true
      def eth_syncing(opts \\ []) do
        request("eth_syncing", [], opts)
      end

      @doc """
      Returns the coinbase address for this client
      iex> {"id":10,"jsonrpc":"2.0","method":"eth_coinbase","params":[]}
      """
      # @impl true
      def eth_coinbase(opts \\ []) do
        request("eth_coinbase", [], opts)
      end

      @doc """
      Determines if this client is mining new blocks
      iex> {"id":6,"jsonrpc":"2.0","method":"eth_mining","params":[]}
      """
      # @impl true
      def eth_mining(opts \\ []) do
        request("eth_mining", [], opts)
      end

      @doc """
      """
      @impl true
      def eth_get_compilers(opts \\ []) do
        request("eth_getCompilers", [], opts)
      end

      @doc """
      Creates a filter to listen for new pending transactions that can be used with eth_getFilterChanges
      iex> {"id":3,"jsonrpc":"2.0","method":"eth_newPendingTransactionFilter","params":[]}
      """
      @impl true
      def eth_new_pending_transaction_filter(opts \\ []) do
        request("eth_newPendingTransactionFilter", [], opts)
      end

      ### Request ###

      defp post_request(payload, opts) do
        {:error, :not_implemented}
      end


      # The function that a behavior like HTTP or IPC needs to implement.
      defoverridable post_request: 2

      def request(name, params, opts) do
        name
        |> add_request_info(params)
        |> server_request(opts)
      end

      # @spec add_request_info(binary, [boolean() | binary | map | [binary]]) :: map
      defp add_request_info(method_name, params \\ []) do
        %{}
        |> Map.put("method", method_name)
        |> Map.put("jsonrpc", "2.0")
        |> Map.put("params", params)
      end

      # @spec server_request(list(map()) | map(), list()) :: {:ok, [any()]} | {:ok, any()} | error
      defp server_request(params, opts \\ []) do
        params
        |> prepare_request()
        |> single_request(opts)
      end

      defp prepare_request(params), do: Map.put(params, "id", Counter.increment(:rpc_counter))

      def single_request(payload, opts \\ []) do
        payload
        |> encode_payload()
        |> post_request(opts)
      end

      defp encode_payload(payload) do
        payload |> Jason.encode!()
      end
    end
  end
end
