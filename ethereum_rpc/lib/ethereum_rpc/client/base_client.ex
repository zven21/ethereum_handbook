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
      iex> {"id":14,"jsonrpc":"2.0","method":"eth_getBalance","params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","latest"]}
      """
      # @impl true
      def eth_get_balance(address, block \\ "latest", opts \\ []) do
        params = [address, block]

        request("eth_getBalance", params, opts)
      end

      @doc """
      iex>
      {
        "id": "1337",
        "jsonrpc": "2.0",
        "method": "eth_getStorageAt",
        "params":["0x407d73d8a49eeb85d32cf465507dd71d507100c1","0x0","latest"]
       }
      """
      # @impl true
      def eth_get_storage_at(address, position, block \\ "latest", opts \\ []) do
        params = [address, position, block]

        request("eth_getStorageAt", params, opts)
      end

      @doc """
      """
      # @impl true
      def eth_get_block_transaction_count_by_hash(hash, opts \\ []) do
        params = [hash]

        request("eth_getBlockTransactionCountByHash", params, opts)
      end

      @doc """
      """
      # @impl true
      def eth_get_block_transaction_count_by_number(block \\ "latest", opts \\ []) do
        params = [block]

        request("eth_getBlockTransactionCountByNumber", params, opts)
      end

      @doc ""
      def eth_send_raw_transaction(data, opts \\ []) do
        params = [data]

        request("eth_sendRawTransaction", params, opts)
      end

      @doc """
      """
      def eth_get_uncle_count_by_block_number(block \\ "latest", opts \\ []) do
        params = [block]

        request("eth_getUncleCountByBlockNumber", params, opts)
      end

      @doc ""
      def eth_get_code(address, block \\ "latest", opts \\ []) do
        params = [address, block]

        request("eth_getCode", params, opts)
      end

      @doc ""
      def eth_sign(address, message, opts \\ []) do
        params = [address, message]

        request("eth_sign", params, opts)
      end

      @doc ""
      def eth_send_transaction(transaction, opts \\ []) do
        params = [transaction]

        request("eth_sendTransaction", params, opts)
      end

      @doc """
      """
      # @impl true
      def eth_get_transaction_count(address, block \\ "latest", opts \\ []) do
        params = [address, block]

        request("eth_getTransactionCount", params, opts)
      end

      @doc """
      """
      @impl true
      def eth_get_uncle_count_by_block_hash(hash, opts \\ []) do
        params = [hash]

        request("eth_getUncleCountByBlockHash", params, opts)
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
      # @impl true
      def eth_new_pending_transaction_filter(opts \\ []) do
        request("eth_newPendingTransactionFilter", [], opts)
      end

      # @impl true
      def eth_call(transaction, block \\ "latest", opts \\ []) do
        params = [transaction, block]

        request("eth_call", params, opts)
      end

      # @impl true
      def eth_estimate_gas(transaction, opts \\ []) do
        params = [transaction]

        request("eth_estimateGas", params, opts)
      end

      # @impl true
      def eth_get_block_by_hash(hash, full, opts \\ []) do
        params = [hash, full]

        request("eth_getBlockByHash", params, opts)
      end

      # @impl true
      def eth_get_block_by_number(number, full, opts \\ []) do
        params = [number, full]

        request("eth_getBlockByNumber", params, opts)
      end

      # @impl true
      def eth_get_transaction_by_hash(hash, opts \\ []) do
        params = [hash]

        request("eth_getTransactionByHash", params, opts)
      end

      # @impl true
      def eth_get_transaction_by_block_hash_and_index(hash, index, opts \\ []) do
        params = [hash, index]

        request("eth_getTransactionByBlockHashAndIndex", params, opts)
      end

      # @impl true
      def eth_get_transaction_by_block_number_and_index(block, index, opts \\ []) do
        params = [block, index]

        request("eth_getTransactionByBlockNumberAndIndex", params, opts)
      end

      # @impl true
      def eth_get_transaction_receipt(hash, opts \\ []) do
        params = [hash]

        request("eth_getTransactionReceipt", params, opts)
      end

      @impl true
      def eth_get_uncle_by_block_hash_and_index(hash, index, opts \\ []) do
        params = [hash, index]

        request("eth_getUncleByBlockHashAndIndex", params, opts)
      end

      @impl true
      def eth_get_uncle_by_block_number_and_index(block, index, opts \\ []) do
        params = [block, index]

        request("eth_getUncleByBlockNumberAndIndex", params, opts)
      end

      # @impl true
      # def eth_get_compilers(opts \\ []) do
      #   request("eth_getCompilers", [], opts)
      # end

      @impl true
      def eth_compile_lll(data, opts \\ []) do
        params = [data]

        request("eth_compileLLL", params, opts)
      end

      @impl true
      def eth_compile_solidity(data, opts \\ []) do
        params = [data]

        request("eth_compileSolidity", params, opts)
      end

      @impl true
      def eth_compile_serpent(data, opts \\ []) do
        params = [data]

        request("eth_compileSerpent", params, opts)
      end

      @impl true
      def eth_new_filter(data, opts \\ []) do
        params = [data]

        request("eth_newFilter", params, opts)
      end

      # @impl true
      # def eth_new_block_filter(opts \\ []) do
      #   request("eth_newBlockFilter", [], opts)
      # end

      # @impl true
      # def eth_new_pending_transaction_filter(opts \\ []) do
      #   request("eth_newPendingTransactionFilter", [], opts)
      # end

      # @impl true
      # def eth_uninstall_filter(id, opts \\ []) do
      #   params = [id]

      #   request("eth_uninstallFilter", params, opts)
      # end

      @impl true
      def eth_get_filter_changes(id, opts \\ []) do
        params = [id]

        request("eth_getFilterChanges", params, opts)
      end

      @impl true
      def eth_get_filter_logs(id, opts \\ []) do
        params = [id]

        request("eth_getFilterLogs", params, opts)
      end

      @impl true
      def eth_get_logs(filter, opts \\ []) do
        params = [filter]

        request("eth_getLogs", params, opts)
      end

      @impl true
      def eth_get_work(opts \\ []) do
        request("eth_getWork", [], opts)
      end

      @impl true
      def eth_get_proof(address, storage_keys, block \\ "latest", opts \\ []) do
        params = [address, storage_keys, block]

        request("eth_getProof", params, opts)
      end

      # @impl true
      # def eth_submit_work(nonce, header, digest, opts \\ []) do
      #   params = [nonce, header, digest]

      #   request("eth_submitWork", params, opts)
      # end

      # @impl true
      # def eth_submit_hashrate(hashrate, id, opts \\ []) do
      #   params = [hashrate, id]

      #   request("eth_submitHashrate", params, opts)
      # end

      # @impl true
      # def db_put_string(db, key, value, opts \\ []) do
      #   params = [db, key, value]

      #   request("db_putString", params, opts)
      # end

      # @impl true
      # def db_get_string(db, key, opts \\ []) do
      #   params = [db, key]

      #   request("db_getString", params, opts)
      # end

      # @impl true
      # def db_put_hex(db, key, data, opts \\ []) do
      #   params = [db, key, data]

      #   request("db_putHex", params, opts)
      # end

      # @impl true
      # def db_get_hex(db, key, opts \\ []) do
      #   params = [db, key]

      #   request("db_getHex", params, opts)
      # end

      # @impl true
      # def shh_post(whisper, opts \\ []) do
      #   params = [whisper]

      #   request("shh_post", params, opts)
      # end

      # @impl true
      # def shh_version(opts \\ []) do
      #   request("shh_version", [], opts)
      # end

      # @impl true
      # def shh_new_identity(opts \\ []) do
      #   request("shh_newIdentity", [], opts)
      # end

      # @impl true
      # def shh_has_identity(address, opts \\ []) do
      #   params = [address]

      #   request("shh_hasIdentity", params, opts)
      # end

      # @impl true
      # def shh_new_group(opts \\ []) do
      #   request("shh_newGroup", [], opts)
      # end

      # @impl true
      # def shh_add_to_group(address, opts \\ []) do
      #   params = [address]

      #   request("shh_addToGroup", params, opts)
      # end

      # @impl true
      # def shh_new_filter(filter_options, opts \\ []) do
      #   params = [filter_options]

      #   request("shh_newFilter", params, opts)
      # end

      # @impl true
      # def shh_uninstall_filter(filter_id, opts \\ []) do
      #   params = [filter_id]

      #   request("shh_uninstallFilter", params, opts)
      # end

      # @impl true
      # def shh_get_filter_changes(filter_id, opts \\ []) do
      #   params = [filter_id]

      #   request("shh_getFilterChanges", params, opts)
      # end

      @impl true
      def shh_get_messages(filter_id, opts \\ []) do
        params = [filter_id]

        "shh_getMessages" |> request(params, opts)
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
