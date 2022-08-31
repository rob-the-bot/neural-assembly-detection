function control_max_eig = circular_shift(SpikeCount,number_of_surrogates)

control_max_eig=zeros(1,number_of_surrogates);
for surr_idx = 1:number_of_surrogates
    ControlSpikeCount=zeros(size(SpikeCount));
    for neuron_idx = 1:size(SpikeCount,1)
        drawnbin = randi(length(SpikeCount),1);
        auxbin = [drawnbin:length(SpikeCount) 1:drawnbin-1];
        ControlSpikeCount(neuron_idx,:) = SpikeCount(neuron_idx,auxbin);
    end
    CorrelationMatrix = corr(ControlSpikeCount');
    control_max_eig(surr_idx)=eigs(CorrelationMatrix, 1);
end
