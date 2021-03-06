shared_examples_for 'with_node' do |html|

    let(:with_node) do
        dupped = subject.dup
        dupped.html = html
        dupped
    end

    describe '#to_rpc_data' do
        let(:data) { with_node.to_rpc_data }

        it "includes 'html'" do
            data['html'].should == html
        end
    end

    describe '#node' do
        it 'returns the set node' do
            node = with_node.node
            node.is_a?( Nokogiri::XML::Element ).should be_true
            node.to_s.should == Nokogiri::HTML.fragment( html ).to_s
        end
    end

    describe '#to_h' do
        it "includes 'html'" do
            subject.to_h[:html].should == subject.html
        end
    end

    describe '#dup' do
        let(:dupped) { with_node.dup }

        it 'preserves #html' do
            dupped.html.should == with_node.html
        end

        it 'preserves #node' do
            dupped.node.to_s.should == with_node.node.to_s
        end
    end
end
