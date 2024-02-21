
[1mFrom:[0m /home/zhar/project/sprl-eproc/app/models/purch_reqn.rb:47 PurchReqn#generate_flow:

    [1;34m45[0m: [32mdef[0m [1;34mgenerate_flow[0m(seq = [1;34m0[0m)
    [1;34m46[0m:   step = workflow_steps.find_by([35mseq[0m:)
 => [1;34m47[0m:   binding.pry
    [1;34m48[0m:   comment = {}
    [1;34m49[0m: 
    [1;34m50[0m:   [32mif[0m seq.positive?
    [1;34m51[0m:     workflow_instance.state = [31m[1;31m'[0m[31mINACTIVE[1;31m'[0m[31m[0m
    [1;34m52[0m:     workflow_instance.updated_by_id = updated_by_id
    [1;34m53[0m:     workflow_instance.save!
    [1;34m54[0m:   [32melse[0m
    [1;34m55[0m:     comment = { [35mcomment[0m: [31m[1;31m'[0m[31mWorkflow Started[1;31m'[0m[31m[0m }
    [1;34m56[0m:   [32mend[0m
    [1;34m57[0m: 
    [1;34m58[0m:   instance = workflow_instances.create([35mworkflow_step_id[0m: step.id, [35mcreated_by_id[0m:, **comment)
    [1;34m59[0m:   [1;36mself[0m.current_workflow_instance_id = instance.id
    [1;34m60[0m:   save!
    [1;34m61[0m: [32mend[0m

